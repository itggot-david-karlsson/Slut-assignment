class App < Sinatra::Base
  enable :sessions

  get '/' do

    if session[:user_id]
      @account = (User.first(id: session[:user_id])).username
    else
      @account = "Log in/Register"
    end

    @milestones = Milestone.all
    erb :index

  end

  get '/milestone/search' do

    if session[:user_id]
      @account = (User.first(id: session[:user_id])).username
    else
      redirect '/account'
    end

    @results = Milestone.all(:name.like => params['search'])

    erb :'milestone_erb/milestone_results'

  end

  post '/add/:id' do |milestone_id|

    Priority.create(klass: params['klass'], user_id: session[:user_id], milestone_id: milestone_id)
    redirect '/milestones/list'

  end

  get '/milestone/:id' do |milestone_id|

    if session[:user_id]
      @account = (User.first(id: session[:user_id])).username
    else
      redirect '/account/p'
    end

    @milestone = Milestone.all(id: milestone_id)
    erb :'milestone_erb/milestone_page'

  end

  get '/milestones/list' do

    if session[:user_id]
      @account = (User.first(id: session[:user_id])).username
    else
      redirect '/account/p'
    end

    @prioritys = Priority.all(user_id: session[:user_id])
    @milestones = Milestone.all
    @klass_1 = []
    @klass_2 = []
    @klass_3 = []
    @klass_4 = []

    for priority in Priority.all(user_id: session[:user_id])
      if priority.klass == "1"
        @klass_1.insert(-1, priority)
      elsif priority.klass == "2"
        @klass_2.insert(-1, priority)
      elsif priority.klass == "3"
        @klass_3.insert(-1, priority)
      elsif priority.klass == "4"
        @klass_4.insert(-1, priority)
      end
    end

    erb :'milestone_erb/milestone_list'

  end

  post '/my_milestone/delete/:del' do |del|

    Priority.first(id: del).destroy
    redirect '/milestones/list'

  end

  get '/my_milestone/:id' do |priority|

    if session[:user_id]
      @account = (User.first(id: session[:user_id])).username
    else
      redirect '/account'
    end

    @priority = Priority.first(id: priority)
    @milestone = Milestone.first(id: @priority.milestone_id)
    erb :'milestone_erb/my_milestone'

  end

  get '/create_milestone' do

    if session[:user_id]
      @account = (User.first(id: session[:user_id])).username
    else
      redirect '/account'
    end

    erb :'milestone_erb/milestone_create'

  end

  get '/users/:username' do |username|

    if session[:user_id]
      @account = (User.first(id: session[:user_id])).username
    else
      redirect '/account'
    end

    @profile = User.all(username: username)
    erb :'user_erb/user_profile'

  end

  get '/account/:message' do |message|

    if session[:user_id]
      @account = (User.first(id: session[:user_id])).username
    else
      @account = "Log in/Register"
    end

    if message == 'no_usr_pswrd'
      @message = "No username or password input."
    elsif message == 'no_username'
      @message = "Username can't be blank."
    elsif message == 'no_password'
      @message = "Password can't be blank."
    elsif message == 'wrong'
      @message = "Wrong username or password."
    elsif message == 'p'
      @message = "Please log in or press the register-button."
    else
    end

    if session[:user_id]
      @current_user = User.first(id: session[:user_id])
      erb :'account/logged_in'
    else
      erb :'account/login'
    end

  end

  get '/register/:message' do |message|

    if message == 'no_usr_pswrd'
      @message = "No username or password input."
    elsif message == 'no_username'
      @message = "Username can't be blank."
    elsif message == 'no_password'
      @message = "Password can't be blank."
    elsif message == 'p'
      @message = "Please type in a username and password and press the register-button."
    elsif message == 'usr_exist'
      @message = "Username already taken by someone else."
    else
    end

    if session[:user_id]
      @account = (User.first(id: session[:user_id])).username
      redirect
    else
      @account = "Log in/Register"
    end

    erb :'account/register'

  end

  post '/register_account' do

    if User.first(username: params['username'])
      redirect '/register/usr_exist'
    else
      if params['username'] != '' && params['password'] != ''
        User.create(username: params['username'], password: params['password'])
        redirect '/account/p'
      elsif params['username'] == ''
        if params['password'] == ''
          redirect '/register/no_usr_pswrd'
        else
          redirect '/register/no_username'
        end
      elsif params['password'] == ''
        redirect '/register/no_password'
      end
    end

  end

  post '/login' do

    user = User.first(username: params['username'])
      if user && user.password == params['password']
        session[:user_id] = user.id
        redirect '/account/logged_in'
      else
        # redirect '/account'
        if params['username'] == ''
          if params['password'] == ''
            redirect '/account/no_usr_pswrd'
          else
            redirect '/account/no_username'
          end
        elsif params['password'] == ''
          redirect '/account/no_password'
        else
          redirect '/account/wrong'
        end
      end

    p "\n"*3
    p "#{params['username']}"
    p "\n"*3

  end

  post '/logout' do
    session[:user_id] = nil
    redirect '/'
  end

  post '/create_the_milestone' do

    if session[:user_id]
      @account = (User.first(id: session[:user_id])).username
    else
      redirect '/account/p'
    end

    puts "\n"
    Milestone.create(name: params['name'], description: params['description'])
    puts "\n"
    redirect '/'
  end

end