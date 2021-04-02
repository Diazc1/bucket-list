class TravelDestinationsController < ApplicationController

    #READ all travel_destinations
    get '/travel_destinations' do
        @travel_destinations = TravelDestination.all
        erb :'travel_destinations/index'
    end


    #CREATE new travel_destination (render form)

    get '/travel_destinations/new' do
        erb :'travel_destinations/new'
    end


    #READ 1 travel_destination

    get '/travel_destinations/:id' do
        @travel_destination = TravelDestination.find_by_id(params[:id])
        erb :'travel_destinations/show'
    end

    #CREATE new travel_destination (save in db)

    post '/travel_destinations' do 
        travel_destination = TravelDestination.new(params["travel_destination"])

        if travel_destination.save
            redirect "/travel_destinations/#{travel_destination.id}"
        else
            redirect "/travel_destinations/new"
        end
        
    end


    #UPDATE 1 travel_destination (render form)

    get '/travel_destinations/:id/edit' do
        @travel_destination = TravelDestination.find_by_id(params[:id])
        erb :'travel_destinations/edit'
    end


    #UPDATE 1 travel_destination (save in db)

    patch '/travel_destinations/:id' do
        travel_destination = TravelDestination.find_by_id(params[:id])
        

        if travel_destination.save
            redirect "/travel_destinations/#{travel_destination.id}"
        else
            redirect "/travel_destinations/#{travel_destination.id}/edit"
        end
    end


    #DELETE 1 travel_destination

    delete '/travel_destinations/:id' do
        travel_destination = TravelDestination.find_by_id(params[:id])
        travel_destination.destroy

        redirect "/travel_destinations"
    end


end