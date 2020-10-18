class UsersController < ApplicationController
    get '/signup' do
        erb :"/user/new"
    end

    post '/signup' do
        @user = User.create(params["user"])
        redirect to "/login"
    end

    get '/login' do
        "login"
    end
end