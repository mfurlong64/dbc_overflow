class Vote < ActiveRecord::Base

  belongs_to :votable, polymorphic: true
  belongs_to :user

  #attr_accessible :user

  validates_presence_of :user
  validates :user_id, :uniqueness => { :scope => [:votable_type, :votable_id] }

end
