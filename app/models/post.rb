class Post < ApplicationRecord
  belongs_to :user
has_many :comments, as: :commentable
  has_many :taggings,dependent: :destroy
  has_many :tags, through: :taggings
  validates :body, presence: true 
  def all_tags=(names)
    self.tags=names.split(",").map do |name|
      Tag.where(name: name).first_or_create!
    end
  end
   
  def all_tags
    tags.map(&:name).join(",")
  end
end
