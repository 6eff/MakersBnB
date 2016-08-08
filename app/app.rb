require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

ENV['RACK_ENV'] ||= 'development'
require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base

  get '/users/new' do
    erb :"/users/new"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
