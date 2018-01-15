class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :tags, through: :article_tags
  has_many :article_tags, dependent: :destroy
  validates :title, :body, presence: true
  # mount_uploader :thum, ImageUploader
end
