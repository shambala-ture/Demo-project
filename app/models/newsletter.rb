class Newsletter < ActiveRecord::Base
  validates :email, confirmation: true   
end
