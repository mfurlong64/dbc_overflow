require 'bcrypt'
class User < ActiveRecord::Base

  has_many :questions
  has_many :answers
  has_many :votes

  validates :email, uniqueness: true

  include BCrypt

 def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end

  def self.authenticate(email, password)
    @user = User.find_by(email: email)
     p "9"*24
    p @user
    p @user.password == password
    p password
     p "9"*24
    if @user && @user.password == password
      @user
    else
      nil
    end
  end

end
