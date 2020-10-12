class Loaf < ApplicationRecord
	belongs_to :category
	has_one_attached :image
	#:name, :ingredients, :active_item, :price, :image, :category_id 


	validates :name, length: { minimum: 2, too_long: "%{count} Character is the maximum allowed" }, presence: true
	validates :active_item, presence: true
	validates :category_id, presence: true
	#validates :image, presence: true, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..3.megabytes } 
end
