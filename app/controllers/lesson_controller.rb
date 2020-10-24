class LessonController < ApplicationController

    #create

    get '/lessons/new' do
        erb :"/lesson/new"
    end

    post '/lessons' do
        @lesson = Lesson.create(params["lesson"])
        @lesson.user = current_user
        @lesson.save

        redirect to "/lessons/#{@lesson.id}"
    end

    #read

    get '/lessons' do
        @lesson = Lesson.all

        erb  :"/lesson/index"
    end

    get  '/lessons/:id' do
        @lesson = Lesson.find_by_id(params[:id])
        @user = @lesson.user

        erb :"/lesson/show"
    end

    #update
    

    #delete
end