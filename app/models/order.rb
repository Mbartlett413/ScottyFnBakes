class Order < ApplicationRecord
	belongs_to :day
	has_many :order_collections, foreign_key: :order_id, class_name: "OrderCollection"
	#accepts_nested_attributes_for :order_collections
end
