class LessonController < ApplicationController

    #create

    #read

    get '/lessons' do
        @lesson = Lesson.all

        erb  :"/lesson/index"
    end

    #update
    get  '/lessons/:id' do
    end

    #delete
end