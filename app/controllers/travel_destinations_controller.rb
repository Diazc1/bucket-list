class TravelDestinationsController < ApplicationController

    #READ all travel_destinations
    get '/travel_destinations' do
        @travel_destinations = Travel_destination.all
        erb :index
    end


    #READ 1 travel_destination


    #CREATE new travel_destination (render form)


    #CREATE new travel_destination (save in db)


    #UPDATE 1 travel_destination (render form)


    #UPDATE 1 travel_destination (save in db)


    #DELETE 1 travel_destination


end