class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :addresses, :dependent => :destroy
  has_many :user_order, :dependent => :destroy
  has_many :used_coupon, :dependent => :destroy
  has_many :payment_gateway, :dependent => :destroy
end
