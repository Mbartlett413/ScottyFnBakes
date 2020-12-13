class DaysController < ApplicationController
  before_action :set_day, only: [:show, :edit, :update, :destroy]
  protect_from_forgery prepend: true

  # GET /days
  # GET /days.json
  def index
    @days = Day.all 
  end

  # GET /days/1
  # GET /days/1.json
  def show
    @loafs = Loaf.all 
  end

  # GET /days/new
  def new
    logger.debug("Hit")
    @day = Day.new
  end

  # GET /days/1/edit
  def edit
  end

  # POST /days
  # POST /days.json
  def create
    #CREATE METHOD IS USED FOR CREATING A DATE AND THEN EDITTIN FOR AN ADMIN
    hackery = params[:this_date].to_s + ' 00:00:00'
    @existing_date = Day.where("this_date = ?", hackery)
    if @existing_date.length == 0 
      
      @day = Day.new
      @day.this_date = hackery
      logger.debug("New Day Creation #{@day.inspect}")
        respond_to do |format|
          if @day.save
            format.html { redirect_to edit_day_path(@day.id), notice: 'Day was successfully created.' }
          else
            format.html { render :new }
            format.json { render json: @day.errors, status: :unprocessable_entity }
          end
        end
    else 
      logger.debug("finding orders for date, #{@existing_date[0].inspect}")
        
      redirect_to edit_day_path(@existing_date[0].id)
    end 
  end

  # PATCH/PUT /days/1
  # PATCH/PUT /days/1.json
  def update
    respond_to do |format|
      if @day.update(day_params)

        # NOT DRY
        quanSum = []
        @day.orders.each do |order|
          order.order_collections.each do |oc|
            quanSum.push(oc.quantity)
          end 
        end 
        new_avaliablility = @day.max_orders - quanSum.sum
        @day.update_attribute(:avaliable_spots, new_avaliablility)
        ##

        format.html { redirect_to admin_page_path, notice: 'Day was successfully updated.' }
        format.json { render :show, status: :ok, location: @day }
      else
        format.html { render :edit }
        format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /days/1
  # DELETE /days/1.json
  def destroy
    @day.destroy
    respond_to do |format|
      format.html { redirect_to admin_page_path, notice: 'Day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:id])
    end

    # Only allow a list of trusted parameters through. 
    def day_params
        params.require(:day).permit(:max_orders, :avaliable_spots, :this_date, :closed)
    end
end
