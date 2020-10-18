class UsersController < ApplicationController
    get "/signup" do
        erb :"/user/new"
    end
end