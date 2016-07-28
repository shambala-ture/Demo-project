class Cm < ActiveRecord::Base
  validates :key, :value, :presence =>true
end
