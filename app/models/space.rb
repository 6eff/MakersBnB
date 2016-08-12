class Space

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :address, String, required: true
  property :description, Text
  property :price, Decimal, precision: 15, scale: 4

  has n, :renters, 'User', through: :bookings, via: :user
  has n, :bookings
  belongs_to :owner, 'User', child_key: ['user_id']

end
