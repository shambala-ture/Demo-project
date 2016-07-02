class PaymentGateway < ActiveRecord::Base
  belongs_to :user_order
end
