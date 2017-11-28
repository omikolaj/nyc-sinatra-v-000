class LandmarksController < ApplicationController


    get '/landmarks' do
        erb :"landmarks/index"
    end
    
    get '/landmarks/new' do
        erb :"landmarks/new"
    end

    get '/landmarks/:id' do
        @landmark = Landmark.find_by_id(params["id"])
        erb :"landmarks/show"
    end

    get '/landmarks/:id/edit' do
        @landmark = Landmark.find_by_id(params["id"])
        erb :"landmarks/edit" 
    end

    patch '/landmarks/:id' do
        @landmark = Landmark.find_by_id(params[:id])
        @landmark.update(params[:landmark])
        @landmark.save
        redirect "landmarks/#{@landmark.id}"
    end

    post '/landmarks' do
       
        @landmark = Landmark.new(:name => params["landmark"]["name"], :year_completed => params["landmark"]["year_completed"])
        @landmark.save
        redirect "landmarks/index"
    end


end
