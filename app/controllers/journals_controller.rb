class JournalsController < ApplicationController
    enable :sessions

    get '/journals' do
        @journals = Journal.all
        erb :'journals/index'
    end

    get '/journals/new' do
        if Helper.is_logged_in?(session)
            @user = Helper.current_user(session)
            erb :'journals/new'
        else
            redirect to '/login'
        end
    end

    post '/journals' do
        if params[:tree_id] != "" && params[:activities] != ""
            # @user = Helper.current_user(session)
            # @tree = @user.trees.find_by(params[:tree_id])
            @journal = Journal.create(params)

            @user = Helper.current_user(session)
            @journal.user_id = @user.id
            @journal.journal_time = Time.now.strftime("%F")
            @journal.save

            redirect to '/journals'
        else
            redirect to '/journals/new'
            flash[:message] = "Please select a tree and activity!"
        end
    end

    get '/journals/:id' do
        if Helper.is_logged_in?(session)
            @journal = Journal.find(params[:id])
            erb :'/journal/show'
        else
            redirect to '/login'
        end
    end

end