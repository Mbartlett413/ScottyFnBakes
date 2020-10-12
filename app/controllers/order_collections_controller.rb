class OrderCollectionsController < ApplicationController
	#
	before_action :set_oc, only: [:destroy]
	before_action :authenticate_user!

	def update
		@src = OrderCollection.find_by_id(params[:id])
		@src.update_attributes(:loaf_id => params[:order_collection][:loaf_id], :quantity =>params[:order_collection][:quantity])
		@order = Order.find_by_id(@src.order_id)
		@day = Day.find_by_id(@src.day_id)

		quanSum = []
		@day.orders.each do |order|
			order.order_collections.each do |oc|
				quanSum.push(oc.quantity)
			end 
		end 
		new_avaliablility = @day.max_orders - quanSum.sum
		@day.update_attribute(:avaliable_spots, new_avaliablility)

	    respond_to do |format|
	        format.html { redirect_to order_path(@order.id), notice: 'Order was successfully updated.' }
	        format.json { render :show, status: :ok, location: @order }
	    end
	end 

	def create 
	end 

	# DELETE /set_reps/1
	# DELETE /set_reps/1.json
	def destroy
		logger.debug("blah blah #{@set_rep_combo}")
		@oc.destroy
		respond_to do |format|
		  format.html { redirect_to admin_page_path, notice: 'A piece of an order was destroyed' }
		  format.json { head :no_content }
		end
	end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oc
      @oc = OrderCollection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def set_rep_combo_params
      params.require(:order_collection).permit(:order_id, :quantity, :day_id, :loaf_id)
    end
end

