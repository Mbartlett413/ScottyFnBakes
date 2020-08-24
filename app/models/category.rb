class Category < ApplicationRecord
	has_many :loafs, dependent: :destroy
end
