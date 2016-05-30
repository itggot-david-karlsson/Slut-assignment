require 'pry-byebug'

class App < Sinatra::Base
  enable :sessions

  get '/' do

    if session[:user_id]
      @account = (User.first(id: session[:user_id])).username
    else
      @account = "Log in/Register"
    end

    @users = User.all
    @milestones = Milestone.all
    erb :index

  end

  get '/milestone/:id' do |milestone_id|

    if session[:user_id]
      @account = (User.first(id: session[:user_id])).username
    else
      @account = "Log in/Register"
    end

    @users = User.all
    @milestone = Milestone.all(id: milestone_id)
    erb :'milestone_erb/milestone_page'

  end

  get '/milestones/list' do

    if session[:user_id]
      @account = (User.first(id: session[:user_id])).username
    else
      @account = "Log in/Register"
    end

    @users = User.all
    erb :'milestone_erb/milestone_list'

  end

  get '/create_milestone' do

    if session[:user_id]
      @account = (User.first(id: session[:user_id])).username
    else
      @account = "Log in/Register"
    end

    @users = User.all
    erb :'milestone_erb/milestone_create'

  end

  get '/users/:username' do |username|

    if session[:user_id]
      @account = (User.first(id: session[:user_id])).username
    else
      @account = "Log in/Register"
    end

    @users = User.all
    @profile = User.all(username: username)
    erb :'user_erb/user_profile'

  end

  get '/account' do

    if session[:user_id]
      @account = (User.first(id: session[:user_id])).username
    else
      @account = "Log in/Register"
    end

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

    if session[:user_id]
      @account = (User.first(id: session[:user_id])).username
    else
      @account = "Log in/Register"
    end

    @users = User.all
    erb :'account/register'

  end

  post '/register_account' do

    User.create(username: params['username'], password: params['password'])
    redirect '/account'

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

  post '/create_the_milestone' do
    Milestone.create(name: params['name'], description: params['description'], priority_id: 1 )
    redirect '/'

  end

end