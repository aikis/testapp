class Authentication < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :provider, :uid
  validates :uid, :uniqueness => true
end
