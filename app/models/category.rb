class Category < ActiveRecord::Base
  has_many :categories_articles
  has_many :articles , through: :categories_articles

  validates :title, presence: true
end