require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

ENV['RACK_ENV'] ||= 'development'
require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base

  get '/users/new' do
    erb :"/users/new"
  end

  post '/users' do
    @user = User.new(name: params[:name],
                      email: params[:email],
                      password: params[:password],
                      confirm_password: params[:confirm_password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
