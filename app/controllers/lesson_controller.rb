class LessonController < ApplicationController

    #create

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