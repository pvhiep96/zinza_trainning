class Picture < ApplicationRecord
  belongs_to :product
  mount_uploader :picture_url, PictureUploader
end
