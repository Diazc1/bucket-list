class SessionsController < ApplicationController

    #handles changing my session ie login/logout

    #login route FORM
    get '/login' do
        redirect_if_logged_in
        #render form with email, username amd poassword field
        erb :'/sessions/login'
    end

    #login route POST
    post '/login' do
        redirect_if_logged_in
        #take data find user
        user = User.find_by(email: params["user"]["email"])

        #if that user is authenticated, log in, redirect /travel_destinations
        if user && user.authenticate(params["user"]["password"])
            session["user_id"] = user.id
            redirect "/travel_destinations"

        #if user not valid, send back to /login
        else
            redirect "/login"
        end

    end

    #logout DELETE (get/post)
    delete '/logout' do
        redirect_if_not_logged_in
        #logout a user
        session.delete("user_id")
        redirect "/login"
    end


end

