class TravelDestinationsController < ApplicationController

    #READ all travel_destinations
    get '/travel_destinations' do
        @travel_destinations = TravelDestination.all
        erb :'travel_destinations/index'
    end


    #READ 1 travel_destination

    get '/travel_destinations/:id' do
        @travel_destinations = TravelDestination.find_by_id(params[:id])
        erb :'travel_destinations/show'
    end


    #CREATE new travel_destination (render form)


    #CREATE new travel_destination (save in db)


    #UPDATE 1 travel_destination (render form)


    #UPDATE 1 travel_destination (save in db)


    #DELETE 1 travel_destination


end