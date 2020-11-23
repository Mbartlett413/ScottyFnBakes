class LandingPageController < ApplicationController
before_action :authenticate_user!, only:[:admin_page]
	#This will be the landing page for the user
	#Display everything from here
	def index
		@days = Day.all 
		@loafs = Loaf.all
		@category = Category.all 
	end 
	
	def admin_page
		@user = current_user
		@days_of_weeks = DaysOfWeek.all.sort_by { |obj| obj.id }
		@days = Day.all.order(:this_date)
		@loafs = Loaf.all.sort_by { |obj| obj.category_id }
		@orders = Order.all	
		@categories = Category.all

	end 

	def toggle
		@dow = DaysOfWeek.find(params[:format])
		if @dow.open == true
			@dow.update_attribute(:open, false)
		else
			@dow.update_attribute(:open, true)
		end 
	end 


end 
