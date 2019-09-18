class UsersController < ApplicationController

    #LOGIN ROUTE
    #render the login form
    get '/login' do
        if logged_in?
            redirect "/users/#{@current_user.id}"
        else
            erb :login
        end
    end

    #take the login params and validate them
    post '/login' do
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            redirect "/login"
        end
    end

    #individual user's show page
    get "/users/:id" do
        @user = User.find_by(id: params[:id])
        erb :"users/show"
    end

    #SIGNUP ROUTE
    #render the signup form
    get "/signup" do
        erb :signup
    end

    post "/users" do
        if params[:name] != "" && params[:email] != "" && params[:passowrd] != ""
            @user = User.create(params)
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            redirect "/signup"
        end
    end

    #LOGOUT ROUTE
    #log a user out and redirect to the homepage
    get "/logout" do
        session.clear
        redirect '/'
    end

end