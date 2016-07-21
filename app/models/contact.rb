class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, confirmation: true
  
end
