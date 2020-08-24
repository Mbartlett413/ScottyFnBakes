class UserController < ApplicationController
	before_action :authenticate_user!

	def edit
		@user = current_user
		logger.debug("HERE WE ARE #{params}")
	end 


	def update
		logger.debug("HERE WE ARE #{params['user']['email']}")
		if params['user']['admin_login_toggle'].to_i == 1
			admin_value = true
		else 
			admin_value = false
		end
		@user = User.find_by_id(params['id'])
		@user.admin_login_toggle = admin_value
		@user.save
		redirect_to admin_page_path
	end 
end
