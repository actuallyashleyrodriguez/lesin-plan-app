class UsersController < ApplicationController
    get '/signup' do
        erb :"/user/new"
    end

    get '/login' do
        erb :"/user/login"
    end

    post '/signup' do #bad date needs to be insterted
        @user = User.new(params["user"])
        if @user.save
            session[:user_id] = @user.id
            redirect to "/users/#{@user.id}"
        else
            flash[:error] = "Please fill in all items."
            redirect to "/signup"
        end
    end

    post '/login' do
        @user= User.find_by(email: params["email"])
        if @user && @user.authenticate(params["password"])
            session[:user_id] = @user.id
            redirect to "/users/#{@user.id}"
        else
            flash[:error] = "Incorrect username or password."
            redirect  to "/login" 
        end
    end

    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        @lesson =  @user.lessons
        erb :"/user/show"
    end

    get '/logout' do
        session.clear
        redirect to "/"
    end
end