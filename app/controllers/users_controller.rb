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
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            redirect "/login"
        end
    end

    #individual user's show page
    get "/users/:id" do

    end

    #SIGNUP ROUTE
    #render the signup form
    get "/signup" do
        erb :signup
    end

    post "/users" do
        if params[:name] != "" && params[:email] != "" && params[:passowrd] != ""
            @user = User.create(params)
            binding.pry
            redirect "/users/#{@user.id}"
        else
            redirect "/signup"
        end
    end

end