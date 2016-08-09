class Space

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :address, String, required: true
  property :description, Text
  property :price, Decimal, precision: 8, scale: 4

end
