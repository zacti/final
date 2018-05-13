class Food < ApplicationRecord
	belongs_to :user, required: false
 	scope :item, -> (input_item) { where("item ILIKE ?", "%#{input_item}%") }
end
