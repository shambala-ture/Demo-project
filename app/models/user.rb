class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :addresses, :dependent => :destroy
  has_many :user_orders
  has_many :orders, through: :user_orders
  has_many :used_coupon, :dependent => :destroy
  has_many :user_wish_list
end