require 'bcrypt'
require 'dm-validations'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String, required: true
  property :email, String, required: true, unique: true, format: :email_address
  property :password_digest, String, length: 60

  attr_accessor :confirm_password
  attr_reader :password

  #validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
