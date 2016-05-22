class App < Sinatra::Base
  enable :sessions

  get '/' do

    @users = User.all
    @milestones = Milestone.all
    erb :index

  end

  get '/milestone/:id' do |milestone_id|

    @milestone = Milestone.get(milestone_id)
    erb :'milestone_erb/milestone_page'

  end

  get '/milestones/1' do

    erb :'milestone_erb/milestone_list'

  end

  get '/users/:username' do |username|

    @users = User.all
    @user = User.get(username: username)
    erb :'user_erb/user_profile'

  end


end