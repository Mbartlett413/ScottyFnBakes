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
    @loafs = Loaf.all 
    @days = Day.all
    @order = Order.new 
    @oc = @order.order_collections.new

    #move to model
    #array of OPEN days of week
    @days_of_weeks = DaysOfWeek.all
    @dow = []
    @days_of_weeks.each do |x|
      if x.open == true
        @dow.push(x.title)
      end 
    end 

    #array of avaliable days 
    @todayToday = DateTime.now
    @dayCollection = []
    i = 1
    while i < 28 do 
      newdate = @todayToday + i.day

      #does DayOfWeek Included in newDate?
      if @dow.include?(newdate.strftime("%^A"))
        @dayCollection.push(newdate.strftime("%Y-%m-%d"))
      end 
    i = i + 1
    end 
    logger.debug("LOOK HERE #{@dayCollection}")

    ##End Day Logic 


  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.jsons

  def false_create
    @order = Order.new(order_params)
    @oc = @order.order_collections.new
    @oc.order_id = @order.id

    logger.debug("exist #{@order} and #{@oc}")
    @order.day_id = params[:order][:order_date]
    logger.debug("HERE #{params[:order][:order_date]}")
    @day = Day.find_by_id(params[:order][:order_date])
    logger.debug("HERE #{@day.inspect}")
    @order.order_date = @day.this_date
    
    respond_to do |format|
      if @order.save


        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end 
  end 

  def create
    #move to model
    @loafs = Loaf.all 
    #array of OPEN days of week
    @days_of_weeks = DaysOfWeek.all
    @dow = []
    @days_of_weeks.each do |x|
      if x.open == true
        @dow.push(x.title)
      end 
    end 

    #array of avaliable days 
    @todayToday = DateTime.now
    @dayCollection = []
    @dayCollection.push(@todayToday.strftime("%Y-%m-%d"))
    i = 1
    while i < 28 do 
      newdate = @todayToday + i.day

      if @dow.include?(newdate.strftime("%^A"))
        @dayCollection.push(newdate.strftime("%Y-%m-%d"))
      end 
    i = i + 1
    end 
    logger.debug("LOOK HERE #{@dayCollection}")

    ##End Day Logic 


    @order = Loaf.new(order_params) 
    logger.debug("NEW ORDER::: #{params}") 
    #Params
    order_quantity = params[:order_details]['0'] 
    logger.debug("Quantity::: #{params[:order_details]['0']}")
    order_type = params[:order_details]['1']
    logger.debug("Loafs:: #{params[:order_details]['1']}")
    if params[:call] == "on"
      call = true
    end 
    if params[:text] == "on"
      text = true
    end 

    ## Convert Date into a friendly single date. Variations in hour/minute/sec can create a new day
    consistientDate = Date.parse(params[:order_date]).strftime("%Y-%m-%d")
    hackery = consistientDate.to_s + ' 00:00:00'
    @existing_date = Day.where("this_date = ?", hackery)
    if @existing_date.length == 0
      # create new date 
      @day = Day.new
      @day.this_date = hackery
      @day.save
    else
      @day = @existing_date[0]
    end     

    logger.debug("What is our day:: #{@day.inspect}")

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
        @order.day_id = @day.id
        #@order.guest_email = params[:guest_email]
        @order.pickup_notes = params[:pickup_notes]
        @order.pickupTime = params[:pickupTime]

    orderSum = params[:order_details]['0'].map(&:to_f).reduce(:+)
    logger.debug("BANAN #{orderSum}")
    valid_Order = @day.avaliable_spots - orderSum
    logger.debug("BANAN #{valid_Order}")


    
    respond_to do |format|

      if valid_Order >= 0
        @order.save
        intQuan = [] 
        #Create All the associated Order Collections
          i = 0
          while i < order_type.length do
            #
            @OC = OrderCollection.new
            @OC.quantity = order_quantity[i] 
            intQuan.push(@OC.quantity)
            @OC.loaf_id = order_type[i] 
            @OC.day_id = @day.id
            @OC.order_id = @order.id
            @OC.save
            logger.debug("new order #{@OC.inspect}")
            #
            i = i + 1
          end 

        newQuan = @day.avaliable_spots.to_i - intQuan.sum.to_i
        @day.update_attribute(:avaliable_spots, newQuan)
        #MAILERS
#@#@#@#@#@#@#@#@#@        OrderMailer.alertBaker(@order.id).deliver_now

        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        logger.debug("QUANTITY ISSUE")
        format.html { render :new }
        format.json { render json: @order.errors, notice: "Too Large" }
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
        format.html { render :edit}
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
      params.permit(:order_details)
      #params.require(:order).permit(:total, :order_date, :paid, :order_made, :guest_name, :guest_number, :guest_email, :call_pref, :text_pref, :day_id, :pickupTime, :pickup_notes )
    end
end
