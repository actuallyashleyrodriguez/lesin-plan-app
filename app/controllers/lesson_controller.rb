class LessonController < ApplicationController

    #create

    get '/lessons/new' do
        if logged_in? 
            erb :"/lesson/new"
        else
            flash[:error] = "Please login or sign-up to create a post"
            redirect to "/"
        end
    end

    post '/lessons' do
        @lesson = Lesson.new(params["lesson"])
        @lesson.user = current_user
        if @lesson.save
        redirect to "/lessons/#{@lesson.id}"
        else
            flash[:error] = "Please fill in all items."
            redirect to "/lessons/new"
        end
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

    get '/lessons/:id/edit' do 
        @lesson = Lesson.find_by_id(params[:id])
        if @lesson.user == current_user
            erb :"/lesson/edit"
        else
            flash[:error] = "You cannot edit this lesson"
            redirect to "/lessons/#{@lesson.id}"
        end
    end
    
    patch '/lessons/:id' do
        @lesson = Lesson.find_by_id(params[:id])
        @lesson.update(params["lesson"])  

        redirect to "/lessons/#{@lesson.id}"
    end

    #delete

    delete '/lessons/:id' do 
        @lesson = Lesson.find_by_id(params[:id])
        @lesson.destroy

        redirect to "/lessons"
    end
end