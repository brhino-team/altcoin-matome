class Article < ApplicationRecord
  belongs_to :user
  validates :title, :body, :thum, presence: true
  mount_uploader :thum, ImageUploader
end
