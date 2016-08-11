class Space

  include DataMapper::Resource

  has n, :users, through: Resource
  #has n, :bookings
  #has n, :users, :through => :bookings
  #has 1, :ownership
  #has 1, :user, :through => :ownership

  property :id, Serial
  property :name, String, required: true
  property :address, String, required: true
  property :description, Text
  property :price, Decimal, precision: 15, scale: 4
  #property :price_for_night, Decimal, precision: 15, scale: 4

end
