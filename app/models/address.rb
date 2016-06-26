class Address < ActiveRecord::Base
  belongs_to :user
  has_many :billing_user_order, :class_name => "UserOrder",:foreign_key => "billing_address_id"
  has_many :shipping_user_order,:class_name => "UserOrder",:foreign_key => "shipping_address_id"
end
