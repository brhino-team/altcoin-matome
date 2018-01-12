class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :title, :body, presence: true
  # mount_uploader :thum, ImageUploader
end
