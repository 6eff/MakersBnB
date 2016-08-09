require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

ENV['RACK_ENV'] ||= 'development'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class MakersBnB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :"/users/new"
  end

  post '/users' do
    @user = User.create(name:                  params[:name],
                        email:                 params[:email],
                        password:              params[:password],
                        password_confirmation: params[:password_confirmation]
                        )
    if @user.save
      session[:user_id] = @user.id
      redirect to '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

  get '/spaces/new' do
    erb :"/spaces/new"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
