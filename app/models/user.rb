class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :email, uniqueness: true
  validates :password, :confirmation => true
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :twitter]
  has_many :addresses, :dependent => :destroy
  has_many :orders
  has_many :used_coupon, :dependent => :destroy
  has_many :user_wish_lists

  def self.from_omniauth(auth)
    identity = Identity.joins(:user).where(provider: auth.provider, uid: auth.uid).where(users: {email: auth.info.email }).first_or_create
    user = identity.user
    unless user
      user = User.new
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.save
      identity.update(user: user)
    end
    user
  end
end