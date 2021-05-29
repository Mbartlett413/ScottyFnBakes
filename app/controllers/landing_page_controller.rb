class LandingPageController < ApplicationController
before_action :authenticate_user!, only:[:admin_page]
protect_from_forgery prepend: true
	#This will be the landing page for the user
	#Display everything from here
	def index
		@days = Day.all 
		@loafs = Loaf.all.sort_by { |obj| obj.name }
		@category = Category.all 
	end 
	
	def admin_page
		@user = current_user
		@days_of_weeks = DaysOfWeek.all.sort_by { |obj| obj.id }
		@days = Day.all.order(:this_date)
		@loafs = Loaf.all.sort_by { |obj| obj.name }
		@orders = Order.all	
		@categories = Category.all 


## This is the 3rd time. Need to put this in a model
    @todayToday = DateTime.now
    @dayCollection = []
    i = 1
    while i < 28 do 
      newdate = @todayToday + i.day
        @dayCollection.push(newdate.strftime("%Y-%m-%d"))

    i = i + 1
    end 
 
	end 

	def toggle
		@loafs = Loaf.all
	    respond_to do |format|
	      format.html
	      format.js
	    end 
	end 

	def dateToggle
		logger.debug("camera man #{params}")
	    respond_to do |format|
	      format.js
	    end 
	end 


end 
