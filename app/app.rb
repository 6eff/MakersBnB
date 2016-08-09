require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  register Sinatra::Flash

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  get '/' do
    erb :index
  end

  get '/users/signup' do
    erb :'/users/new'
  end

  post '/users/create' do
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

  get '/users/signin' do
    erb :'users/login'
  end

  post '/users/login' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/spaces'
    else
      flash.now[:notice] = "Invalid password or email!"
      erb :'users/login'
    end
  end

  delete '/' do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect to '/'
  end

  get '/spaces/new' do
    erb :"/spaces/new"
  end

  post '/spaces' do
    price = BigDecimal.new(params[:price])
    @space = Space.create(name:        params[:name],
                          address:     params[:address],
                          description: params[:description],
                          price:       price
                          )
    redirect to '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'/spaces/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
