class User < ActiveRecord::Base
  has_one :profile
  has_many :articles
  has_many :comments
  has_many :likes

  has_secure_password validations: false

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 3}
end