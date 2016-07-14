class Config < ActiveRecord::Base
  validates :key, :value, :presence =>true
end
