class PlaysController < ApplicationController

    # NEW ROUTE (creating)
    # Render a form to create a new play
    get "/plays/new" do
        erb :"/plays/new"
    end

    # Take the params from the form and create a new play in the db
    # Then redirect to that play's show page
    post "/plays" do
        if !logged_in?
            redirect '/'
        end

        @play = Play.new(params)
        @play.user_id = @current_user.id
        if @play.save
            redirect "/plays/#{@play.id}"
        else
            flash[:message] = "#{@play.errors.full_messages.to_sentence}"
            redirect "/plays/new"
        end
    end

    #INDEX ROUTE (reading)
    get "/plays" do
        @plays = Play.all
        erb :"/plays/index"
    end

    # SHOW ROUTE (reading)
    # render the individual play's show page
    get '/plays/:id' do
        @play = Play.find_by(id: params[:id])
        # @user = User.find_by(id: @play.user_id)
        erb :"/plays/show"
    end

    # EDIT ROUTES (updating)
    # Render the form to edit a play
    get '/plays/:id/edit' do
        @play = Play.find_by(id: params[:id])
        if authorized_to_edit
            erb :"plays/edit"
        else
            redirect '/'
        end
    end

    patch '/plays/:id' do
        @play = Play.find_by(id: params[:id])
        @play.formation = params[:formation]
        @play.name = params[:name]
        @play.setup = params[:setup]
        if @play.save
            redirect "/plays/#{@play.id}"
        else
            flash[:message] = "#{@play.errors.full_messages.to_sentence}"
            redirect "/plays/#{@play.id}/edit"
        end
    end

    # DELETE ROUTE (destroying)
    # Delete a play and redirect to the Play Index
    # The delete button (form) is on the individual play's show page
    delete "/plays/:id" do
        @play = Play.find_by(id: params[:id])
        @play.delete
        redirect "/plays"
    end

    #PRIVATE HELPER METHODS (for PlaysController)
    private

    def no_empty_params
        params[:formation] != "" && params[:name] != "" && params[:setup] != ""
    end

    def authorized_to_edit
        logged_in? && @play.user == current_user
    end

end