class DaysOfWeeksController < ApplicationController
  before_action :set_days_of_week, only: [:show, :edit, :update, :destroy]

  # GET /days_of_weeks
  # GET /days_of_weeks.json
  def index
    @days_of_weeks = DaysOfWeek.all
  end

  # GET /days_of_weeks/1
  # GET /days_of_weeks/1.json
  def show
  end

  # GET /days_of_weeks/new
  def new
    @days_of_week = DaysOfWeek.new
  end

  # GET /days_of_weeks/1/edit
  def edit
    logger.debug("We are here #{@days_of_week}")
    
  end

  # POST /days_of_weeks
  # POST /days_of_weeks.json
  def create
    @days_of_week = DaysOfWeek.new(days_of_week_params)

    respond_to do |format|
      if @days_of_week.save
        format.html { redirect_to @days_of_week, notice: 'Days of week was successfully created.' }
        format.json { render :show, status: :created, location: @days_of_week }
      else
        format.html { render :new }
        format.json { render json: @days_of_week.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /days_of_weeks/1
  # PATCH/PUT /days_of_weeks/1.json
  def update
    respond_to do |format|
      if @days_of_week.update(days_of_week_params)
        format.html { redirect_to @days_of_week, notice: 'Days of week was successfully updated.' }
        format.json { render :show, status: :ok, location: @days_of_week }
      else
        format.html { render :edit }
        format.json { render json: @days_of_week.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /days_of_weeks/1
  # DELETE /days_of_weeks/1.json
  def destroy
    @days_of_week.destroy
    respond_to do |format|
      format.html { redirect_to days_of_weeks_url, notice: 'Days of week was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_days_of_week
      @days_of_week = DaysOfWeek.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def days_of_week_params
      params.require(:days_of_week).permit(:title, :open)
    end
end
