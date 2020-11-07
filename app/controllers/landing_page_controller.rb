class LandingPageController < ApplicationController
before_action :authenticate_user!, only:[:admin_page]
	#This will be the landing page for the user
	#Display everything from here
	def index
		@days = Day.all 
		@loafs = Loaf.all
		@category = Category.all 

		#move to model
		@todayToday = DateTime.now
		@dayCollection = []
		@dayCollection.push(@todayToday.strftime("%Y-%m-%d"))
		i = 1
		while i < 28 do 
			newdate = @todayToday + i.day
			@dayCollection.push(newdate.strftime("%Y-%m-%d"))
		i = i + 1
		end	
		logger.debug("LOOK HERE #{@dayCollection}")
	end 

	def faq
	end 
	
	def admin_page
		@user = current_user
		@days = Day.all.order(:this_date)
		@loafs = Loaf.all.sort_by { |obj| obj.category_id }
		@orders = Order.all	
		@categories = Category.all

	end 

end 
