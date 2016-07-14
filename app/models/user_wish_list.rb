class UserWishList < ActiveRecord::Base
  validates :user_id, :product_id, :presence => true
  belongs_to :product
  belongs_to :user
end
