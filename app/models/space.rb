class Space

  include DataMapper::Resource

  has 1, :user, through: Resource

  property :id, Serial
  property :name, String, required: true
  property :address, String, required: true
  property :description, Text
  property :price, Decimal, precision: 15, scale: 4

end
