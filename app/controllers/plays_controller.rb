class PlaysController < ApplicationController

    # NEW ROUTE
    # Render a form to create a new play
    get "/plays/new" do
        erb :"/plays/new"
    end

    # Take the params from the form and create a new play in the db
    # Then redirect to that play's show page
    post "/plays/" do
        if params[:formation] != "" && params[:name] != "" && params[:setup] != ""
            @play = Play.create(params)
            redirect "/plays/#{@play.id}"
        else
            redirect '/plays/new'
        end
    end

    get "/plays" do
        @plays = Play.all
        erb :"/plays/index"
    end

    # SHOW ROUTE
    # render the individual play's show page
    get '/plays/:id' do
        @play = Play.find_by(id: params[:id])
        erb :"/plays/show"
    end

end