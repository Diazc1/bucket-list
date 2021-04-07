class TravelDestinationsController < ApplicationController

    
    get '/travel_destinations' do
        redirect_if_not_logged_in

        @travel_destinations = current_user.travel_destinations
        erb :'travel_destinations/index'
    end


   

    get '/travel_destinations/new' do
        redirect_if_not_logged_in

        erb :'travel_destinations/new'
    end


    

    get '/travel_destinations/:id' do
        redirect_if_not_logged_in
        redirect_if_not_authorized

        erb :'travel_destinations/show'
    end

    

    post '/travel_destinations' do 
        redirect_if_not_logged_in

        travel_destination = TravelDestination.new(params["travel_destination"])
        travel_destination.user_id = session["user_id"]


        if travel_destination.save
            redirect "/travel_destinations/#{travel_destination.id}"
        else
            flash[:error] = "#{travel_destination.errors.full_messages.join(", ")}"
            redirect "/travel_destinations/new"
        end
        
    end


    

    get '/travel_destinations/:id/edit' do
        redirect_if_not_logged_in
        redirect_if_not_authorized

        erb :'travel_destinations/edit'
    end


    

    patch '/travel_destinations/:id' do
        redirect_if_not_logged_in
        redirect_if_not_authorized

        if @travel_destination.update(params["travel_destination"])
            redirect "/travel_destinations/#{@travel_destination.id}"
        else
            redirect "/travel_destinations/#{@travel_destination.id}/edit"
        end
    end



    delete '/travel_destinations/:id' do
        redirect_if_not_logged_in
        redirect_if_not_authorized

        @travel_destination.destroy

        redirect "/travel_destinations"
    end


    private 

    
    def redirect_if_not_authorized
        @travel_destination = TravelDestination.find_by_id(params[:id])
  
        if @travel_destination.user_id != session["user_id"]
            redirect "/travel_destinations"
        end
    end

end