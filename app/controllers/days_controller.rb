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
    logger.debug("Hit")
    hackery = params[:this_date].to_s + ' 00:00:00'
    @existing_date = Day.where("this_date = ?", hackery)
    logger.debug("h #{@existing_date.length}")

    if @existing_date.length == 0
      @day = Day.new
      @day.this_date = hackery
      @day.todays_order = []
      logger.debug("New Day Creation #{@day.inspect}")
        respond_to do |format|
          if @day.save
            format.html { redirect_to @day, notice: 'Day was successfully created.' }
            #format.json { render :show, status: :created, location: @day }
          else
            format.html { render :new }
            format.json { render json: @day.errors, status: :unprocessable_entity }
          end
        end
    else
      logger.debug("existing date, #{@existing_date[0].inspect}")
        #passive update of day
        sum_array = []
        @existing_date[0].orders.each do |x|
          x.order_details.each do |f,k|
            sum_array.push(k['quantity'].to_i)
          end 
        end 
        logger.debug("mehh #{@existing_date[0].openings}")
        @existing_date[0].openings = @existing_date[0].order_limit - sum_array.sum
        @existing_date[0].save
        logger.debug("sum array sum #{sum_array.sum}")
        #end passive
      redirect_to day_path(@existing_date[0].id)
    end 
  end

  # PATCH/PUT /days/1
  # PATCH/PUT /days/1.json
  def update
    respond_to do |format|
      if @day.update(day_params)
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
        params.require(:day).permit(:order_limit, :openings, :this_date, :todays_order, :closed)
    end
end
