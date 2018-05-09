class Food < ApplicationRecord
	belongs_to :user, required: false

  	mount_uploader :image, AvatarUploader

 	scope :item, -> (input_item) { where("item ILIKE ?", "%#{input_item}%") }

end
