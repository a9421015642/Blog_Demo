class Profile < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true , uniqueness: true
  validates :chinesename, presence: true
  validates :gender, presence: true

end