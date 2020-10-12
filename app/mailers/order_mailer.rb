class OrderMailer < ApplicationMailer
	def alertBaker(order_id)
		@order = Order.find_by_id(order_id)

		mail(to: 'mbartlett413@me.com', subject: 'LETS GET THIS BREAD')
	end 
end
