require 'bcrypt'
require 'dm-validations'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :email, String, required: true, unique: true, format: email_address
  property :password_digest, String, length: 60
end
