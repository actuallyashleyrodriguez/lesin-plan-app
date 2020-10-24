require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "sinatra_lesson_plans"
    register Sinatra::Flash
  end

  get "/" do #if user is logged in automatically go to their homepage
    if logged_in?
      redirect to "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end

  helpers do 
    def current_user
      User.find_by_id(session[:user_id])
    end

    def logged_in?
      !!current_user
    end
  end

end
