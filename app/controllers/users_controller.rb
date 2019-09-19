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
            flash[:message] = "Invalid credentials. Please sign up or try again."
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
        if no_empty_params
            @user = User.create(params)
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

    # PRIVATE HELPER METHODS (for UsersController)
    private

    def no_empty_params
        params[:name] != "" && params[:email] != "" && params[:password] != ""
    end

    def create_session
        session[:user_id] = @user.id
    end

end