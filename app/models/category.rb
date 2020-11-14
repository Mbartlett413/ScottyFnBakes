class Category < ApplicationRecord
	has_many :loafs, dependent: :destroy
	has_one_attached :image
	#:name, :active, :price
	validates :name, length: { minimum: 2, too_long: "%{count} Character is the maximum allowed" }, presence: true
	validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
	validates :active, presence: true



end
