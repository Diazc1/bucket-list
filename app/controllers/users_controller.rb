class UsersController < ApplicationController

    ##handles signup as well as editing or deleteing a user account


    #signup route FORM
    get '/signup' do
        redirect_if_logged_in
        erb :"/users/signup"
    end

    #signup route POST
    post '/signup' do
        redirect_if_logged_in
        #take data create a new user
        user = User.new(params["user"])

        #if that user is good to go, log in, redirect /travel_destinations
        if user.save
            session["user_id"] = user.id
            redirect "/travel_destinations"

        #if user not valid, send back to /signup
        else
            redirect "/signup"
        end
    end


end

