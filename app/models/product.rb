class Product < ActiveRecord::Base
  require 'rubygems'
  require 'roo'

  validates :description, :name, :price, :quantity, :presence =>true
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :product_images
  has_many :order_details
  has_many :orders, through: :order_details
  has_many :user_wish_lists
  has_many :reviews

  def self.import(file)
    s= Roo::Spreadsheet.open(file)
    # s = Roo::Openoffice.open(file, extension: :xls) 
    s.default_sheet = s.sheets.first
    4.upto(7) do |line|
      name       = s.string(line,'A')
      description = s.string(line,'B')
      quantity   = s.float(line,'C')
      price      = s.float(line,'D')
    end
  end
  # def self.import(file)
  #   # csv_file = File.read
  #   CSV.foreach(file.path) do |row|
  #     Product.create! row.to_hash
  #   end
  #   spreadsheet = open_spreadsheet(file)
  #   header = spreadsheet.row(1)
  #   (2..spreadsheet.last_row).each do |i|
  #     row = Hash[[header, spreadsheet.row(i)].transpose]
  #     product = find_by_id(row["id"]) || new
  #     product.attributes = row.to_hash.slice(*accessible_attributes)
  #     product.save!
  #   end
  # end
  # def self.open_spreadsheet(file)
  #   case File.extname(file.original_filename)
  #   when '.csv' then Csv.new(file.path, nil, :ignore)
  #   when '.xls' then Excel.new(file.path, nil, :ignore)
  #   when '.xlsx' then Excelx.new(file.path, nil, :ignore)
  #   else raise "Unknown file type: #{file.original_filename}"
  #   end
  # end
end
