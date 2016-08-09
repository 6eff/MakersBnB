class Space

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :address, String, required: true

end
