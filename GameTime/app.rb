require 'pry-byebug'

class App < Sinatra::Base
  enable :sessions

  get '/' do

    @users = User.all
    @milestones = Milestone.all
    erb :index

  end

  get '/milestone/:id' do |milestone_id|

    @users = User.all
    @milestone = Milestone.all(id: milestone_id)
    erb :'milestone_erb/milestone_page'

  end

  get '/milestones/list' do

    @users = User.all
    erb :'milestone_erb/milestone_list'

  end

  get '/users/:username' do |username|

    @users = User.all
    @profile = User.all(username: username)
    erb :'user_erb/user_profile'

  end

  get '/account' do
    #binding.pry
    @users = User.all
      if session[:user_id]
        @current_user = User.first(id: session[:user_id])
        erb :'account/logged_in'
      else
        erb :'account/login'
      end

  end

  get '/register' do

    @users = User.all
    erb :'account/register'

  end

  post '/register_account' do

    "Hello World"
    
  end

  post '/login' do

    user = User.first(username: params['username'])
      if user && user.password == params['password']
        session[:user_id] = user.id
        redirect '/account'
      else
        redirect '/register'
      end

  end

  post '/logout' do
    session[:user_id] = nil
    redirect '/'
  end

end