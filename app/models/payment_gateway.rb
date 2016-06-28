class PaymentGateway < ActiveRecord::Base
  belongs_to :user
end
