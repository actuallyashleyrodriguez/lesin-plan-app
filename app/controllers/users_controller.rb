class UsersController < ApplicationController
    get '/signup' do
        erb :"/user/new"
    end

    get '/login' do
        erb :"/user/login"
    end

    post '/signup' do
        @user = User.create(params["user"])
        redirect to "/login"
    end

    post '/login' do
        @user= User.find_by(email: params["email"])
        if @user && @user.authenticate(params["password"])
            session[:user_id] = @user.id
            redirect to "/users/#{@user.id}"
        else
            redirect  to "/login"
        end
    end

    get '/users/:id' do
        @user = find_by_id(params[:id])
        
    end
end