class Article < ApplicationRecord
  belongs_to :user
  has_many :images
  validates :title, :body, :thum, presence: true
  mount_uploader :thum, ImageUploader
end
