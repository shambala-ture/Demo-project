class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  require 'roo'
  validates :email, uniqueness: true
  validates :password, :confirmation => true
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :twitter]
  has_many :addresses, :dependent => :destroy
  has_many :orders
  has_many :used_coupon, :dependent => :destroy
  has_many :user_wish_lists
  has_many :reviews

  def self.from_omniauth(auth)
    identity = Identity.where(provider: auth.provider, uid: auth.uid).first_or_create
    email = auth.info.email.present? ? auth.info.email : "#{auth.uid}@twitter.com"
    user = User.where(email: email).first
    unless user
      user = User.new
      user.email = email
      user.password = Devise.friendly_token[0,20]
      user.skip_confirmation!
      user.save
    end
    identity.update(user_id: user.id)
    user
  end

  # def self.import(file)
  #   binding.pry
  #   s = Roo::Spreadsheet.open(file)
  #   # s = Roo::Openoffice.open(file, extension: :xls) 
  #   s.default_sheet = s.sheets.first
  # end

end