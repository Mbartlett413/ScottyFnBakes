class Day < ApplicationRecord
	has_many :orders, dependent: :destroy
	
	def start_time
		self.this_date
	end 
end
