class User < ActiveRecord::Base

  has_many :questions
  has_many :answers
  has_many :votes

  validates :email, uniqueness: true

end
