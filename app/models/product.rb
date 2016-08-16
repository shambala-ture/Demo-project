class Product < ActiveRecord::Base
  require 'rubygems'
  require 'roo'
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, presence: true
  validates :description, length: { maximum: 50 }, presence: true
  validates :price, :numericality => true, length: { maximum:6 }, presence: true
  validates :quantity, length: { maximum:6 }, presence: true
  validates :status, presence: true
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :product_images
  has_many :order_details
  has_many :orders, through: :order_details
  has_many :user_wish_lists
  has_many :reviews

   def self.import(file)
      s = Roo::Spreadsheet.open(file)
      # s = Roo::Openoffice.open(file, extension: :xls) 
      s.default_sheet = s.sheets.first
      # products = Hash.new
      # s.row(1).each_with_index {|product,i|
      # products[product] = i
      # }
      ((s.first_row + 1)..s.last_row).each do |row|
        break if row[0].nil? # if first cell empty
        # puts row.join(',') # looks like it calls "to_s" on each cell's Value
        product = Product.create!(
        name: s.row(row)[0],
        description: s.row(row)[1],
        quantity: s.row(row)[2],
        price: s.row(row)[3]
        )
        # print "#{name}, #{description}, #{quantity}, #{price}\n\n"
      end
    
      # s.each do |row|
      #   break if row[0].nil? # if first cell empty
      #   puts row.join(',') # looks like it calls "to_s" on each cell's Value
      #   product = Product.create!(
      #     name: s.row(2)[0],
      #     description: s.row(2)[1],
      #     quantity: s.row(2)[2],
      #     price: s.row(2)[3]
      #     )
      #   product
      # end
   end
end