class LandingPageController < ApplicationController

	#This will be the landing page for the user
	#Display everything from here
	def index
		@days = Day.all 
		@loafs = Loaf.all
	end 


	def admin_page
		@days = Day.all
		@loafs = Loaf.all
		@orders = Order.all	

	end 

end 
