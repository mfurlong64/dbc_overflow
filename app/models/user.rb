class User < ActiveRecord::Base
  # Remember to create a migration!
   validates :email, uniqueness: true
end
