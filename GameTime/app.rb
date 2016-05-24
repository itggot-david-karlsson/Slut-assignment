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

  get '/Account' do
    "Hello World"
  end

end