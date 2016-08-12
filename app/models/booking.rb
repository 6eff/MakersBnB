class Booking
  include DataMapper::Resource

  property :id, Serial
  property :date, Date
  
  belongs_to :user, key: true
  belongs_to :space, key: true

end
