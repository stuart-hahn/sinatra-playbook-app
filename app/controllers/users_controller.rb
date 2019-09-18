class UsersController < ApplicationController

    #LOGIN ROUTE
    #render the login form
    get '/login' do
        erb :login
    end
end