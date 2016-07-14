class Address < ActiveRecord::Base
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, presence: true
  validates :address_1, length: { maximum: 50 }, presence: true
  validates :address_2, length: { maximum: 50 }
  validates :city, length: { maximum: 10 }, presence: true
  validates :country, length: { maximum:10 }, presence: true
  validates :state, length: { maximum:10 }, presence: true
  validates :zipcode, :numericality => true, length: { maximum:6 }, presence: true
  belongs_to :user
  has_many :billing_user_order, :class_name => "UserOrder",:foreign_key => "billing_address_id"
  has_many :shipping_user_order,:class_name => "UserOrder",:foreign_key => "shipping_address_id"
end
