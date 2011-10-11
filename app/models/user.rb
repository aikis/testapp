class User < ActiveRecord::Base
  has_many :authentications
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # :password_confirmation
  attr_accessible :username, :email, :password,  :remember_me, :invite

  # Omniauth req
  def apply_omniauth(omniauth)
    self.email = omniauth['user_info']['email'] if email.blank?
    self.username = omniauth['user_info']['nickname'] if username.blank?
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
end
