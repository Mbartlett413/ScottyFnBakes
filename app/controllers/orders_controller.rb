class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  protect_from_forgery prepend: true

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @loaf = Loaf.all
  end

  # GET /orders/new
  def new
    @order = Order.new 
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.jsons
  def create
    logger.debug("hitt #{params}") 
    #Params
    order_quantity = params[:order_details]['0'] 
    logger.debug("QUAN #{params[:order_details]['0']}")
    order_type = params[:order_details]['1']
    logger.debug("LOAFFFF #{params[:order_details]['1']}")
    hackery = params[:order_date].to_s + ' 00:00:00'
    @existing_date = Day.where("this_date = ?", hackery)

    if params[:call] == "on"
      call = true
    end 
    if params[:text] == "on"
      text = true
    end 
    
    #Build Order & Order Collection
      @order = Order.new
      @order.total = 0
      @order.order_date = hackery
      @order.paid = false
      @order.order_made = false
      @order.guest_name = params[:guest_name]
      @order.guest_number = params[:guest_number]
      @order.call_pref = params[:call]
      @order.text_pref = params[:text]
      @order.day_id = @existing_date[0].id
    
    respond_to do |format|

      if @order.save
        intQuan = [] 
        #Create All the associated Order Collections
          i = 0
          while i < order_type.length do
            #
            @OC = OrderCollection.new
            @OC.quantity = order_quantity[i] 
            intQuan.push(@OC.quantity)
            @OC.loaf_id = order_type[i] 
            @OC.day_id = @existing_date[0].id
            @OC.order_id = @order.id
            @OC.save
            logger.debug("new order #{@OC.inspect}")
            #
            i = i + 1
          end 

        newQuan = @existing_date[0].avaliable_spots.to_i - intQuan.sum.to_i
        @existing_date[0].update_attribute(:avaliable_spots, newQuan)
        #MAILERS
        OrderMailer.alertBaker(@order.id).deliver_now

        format.html { redirect_to @existing_date[0], notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @existing_date[0] }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    quanInt = []
    @day = Day.find_by_id(@order.day_id) 
      @order.order_collections.each do |whoa|
        quanInt.push(whoa.quantity.to_i)
      end 
    totalQuan = quanInt.sum + @day.avaliable_spots
    @day.update_attribute(:avaliable_spots, totalQuan)



    @order.destroy
    respond_to do |format|
      format.html { redirect_to admin_page_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content } 
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:total, :order_details, :order_date, :paid, :order_made, :day_id, :guest_name, :guest_number ,:call, :text)
    end
end
