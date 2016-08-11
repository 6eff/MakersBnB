class Booking
  include DataMapper::Resource

  property :id, Serial
  #property :start_date, Date
  #property :end_date, Date
  #property :total_price, Integer

  belongs_to :user
  belongs_to :space

end
