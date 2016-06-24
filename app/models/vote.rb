class Vote < ActiveRecord::Base

  belongs_to :voteable, polymorphic: true
  belongs_to :user

  #attr_accessible :user

  validates_presence_of :user
  validates :user_id, :uniqueness => { :scope => [:voteable_type, :voteable_id] }

end
