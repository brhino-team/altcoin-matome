class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :tags, through: :article_tags
  has_many :article_tags, dependent: :destroy
  validates :title, :body, presence: true
  # mount_uploader :thum, ImageUploader

  def save_tags(tag)
    current_tags = tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - tag
    new_tags = tag - current_tags

    # Destroy old taggings:
    old_tags.each do |old_name|
      tags.delete Tag.find_by(name: old_name)
    end

    # Create new taggings:
    new_tags.each do |new_name|
      article_tag = Tag.find_or_create_by(name: new_name)
      tags << article_tag
    end
  end
end
