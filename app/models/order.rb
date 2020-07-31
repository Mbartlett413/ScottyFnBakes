class Order < ApplicationRecord
	#belongs_to :user
	belongs_to :day
	has_many :loafs
end
