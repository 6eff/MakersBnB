class Booking
  include DataMapper::Resource

  property :id, Serial
  property :date, Date
  # property :end_date, Date
  property :details, Text

  belongs_to :user
  belongs_to :space

end
