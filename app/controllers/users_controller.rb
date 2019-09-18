class UsersController < ApplicationController

    #LOGIN ROUTE
    #render the login form
    get '/login' do
        erb :login
    end

    #take the login params and validate them
    post '/login' do
        @user = User.find_by(email: params[:email])
        if @user.authenticate(params[:password])
            redirect "/users/#{@user.id}"
        else
            redirect "/login"
        end
    end

end