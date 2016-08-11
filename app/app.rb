require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'byebug'

ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride
  set :public_folder, Proc.new { File.join(File.dirname(__FILE__),'lib') }

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
      redirect to '/spaces'
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
    current_user.spaces.create(name:            params[:name],
                               address:         params[:address],
                               description:     params[:description],
                               price:           price,
                               available_from:  params[:available_from],
                               available_to:    params[:available_to]
                               )
    # user = User.get(session[:user_id])
    # user.spaces << space
    # space.save
    # user.save
    redirect to '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'/spaces/index'
  end

  get '/spaces/:id' do
    @details = Space.get(params[:id])
    erb :'/spaces/details'
  end

  post '/booking' do

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
