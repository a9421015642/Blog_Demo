class Category < ActiveRecord::Base
  has_many :articles 


  validates :title, presence: true
end