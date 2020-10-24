class LessonController < ApplicationController

    #create

    #read

    get '/lessons' do
        @lesson = Lesson.all

        erb  :"/lesson/index"
    end
    
    get  '/lessons/:id' do
    end

    #update
    

    #delete
end