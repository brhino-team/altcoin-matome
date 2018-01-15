class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :tags, through: :articles_tags
  has_many :articles_tags, dependent: :destroy
end
