class ProductImage < ActiveRecord::Base
  validates :description, :name, :image, :presence => true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  belongs_to :product
end
