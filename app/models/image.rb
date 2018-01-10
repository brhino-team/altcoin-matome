class Image < ApplicationRecord
  belongs_to :article
  mount_uploader :image, ImageUploader
  validates :image_url, presence: true
end
