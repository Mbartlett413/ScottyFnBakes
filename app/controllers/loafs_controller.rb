class LoafsController < ApplicationController
  before_action :set_loaf, only: [:show, :edit, :update, :destroy]

  # GET /loafs
  # GET /loafs.json
  def index
    @loafs = Loaf.all 
  end

  # GET /loafs/1
  # GET /loafs/1.json
  def show
  end

  # GET /loafs/new
  def new
    @loaf = Loaf.new
    @categories = Category.all 
  end

  # GET /loafs/1/edit
  def edit
    @categories = Category.all
  end

  # POST /loafs
  # POST /loafs.json
  def create
    @loaf = Loaf.new(loaf_params) 

    respond_to do |format|
      if @loaf.save
        format.html { redirect_to admin_page_path, notice: 'Loaf was successfully created.' }
        format.json { render :show, status: :created, location: @loaf }
      else
        format.html { render :new }
        format.json { render json: @loaf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loafs/1
  # PATCH/PUT /loafs/1.json
  def update
    respond_to do |format|
      logger.debug("LOAF #{loaf_params}")

      if @loaf.update(loaf_params)
        format.html { redirect_to admin_page_path, notice: 'Loaf was successfully updated.' }
        format.json { render :show, status: :ok, location: @loaf }
      else
        format.html { render :edit }
        format.json { render json: @loaf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loafs/1
  # DELETE /loafs/1.json
  def destroy
    @loaf.destroy
    respond_to do |format|
      format.html { redirect_to admin_page_path, notice: 'Loaf was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loaf
      @loaf = Loaf.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loaf_params
      params.require(:loaf).permit(:name, :ingredients, :active_item, :price, :image, :category_id )
    end
end
