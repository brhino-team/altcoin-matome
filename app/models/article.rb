class Article < ApplicationRecord
  belongs_to :user
  has_many :images
  validates :title, :body, presence: true
end
