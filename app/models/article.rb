class article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :categories_articles
  has_many :categories , through: :categories_articles
end