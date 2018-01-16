class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :articles, through: :article_tags
  has_many :article_tags, dependent: :destroy
end
