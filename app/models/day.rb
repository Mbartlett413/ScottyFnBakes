class Day < ApplicationRecord
	has_many :orders


	def start_time
		self.this_date
	end 
end
