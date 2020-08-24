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
		@days = Day.all.sort_by(&:this_date)
		@loafs = Loaf.all
		@orders = Order.all	
		@categories = Category.all 

	end 

end 
