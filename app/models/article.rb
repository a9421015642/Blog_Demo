class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :categories
  belongs_to :category

# 
  def self.search(search)
    where("title LIKE ?", "%#{search}%") 
  end

end