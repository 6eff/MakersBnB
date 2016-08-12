class Space

  include DataMapper::Resource

  belongs_to :user
  #has n, :bookings
  #has n, :users, :through => :bookings

  property :id, Serial
  property :name, String, required: true
  property :address, String, required: true
  property :description, Text
  property :price, Decimal, precision: 15, scale: 4
  property :available_from, Date, required: true
  property :available_to, Date, required: true

end
