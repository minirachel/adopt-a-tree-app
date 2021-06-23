require 'rack-flash'

class JournalsController < ApplicationController
    enable :sessions
    use Rack::Flash

    get '/journals' do
        @journals = Journal.all
        redirect to '/dashboard'
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
        if Journal.new(params).valid?

            @journal = Journal.create(params)

            @user = Helper.current_user(session)
            @journal.user_id = @user.id
            @journal.journal_time = Time.now.strftime("%F")

            @journal.activities = params[:activities] 

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
            @user = User.find(@journal.user_id)
            erb :'/journals/show'
        else
            redirect to '/login'
        end
    end

    delete '/journals/:id/delete' do
        @journal = Journal.find(params[:id])

        if Helper.clearance?(session, @journal)
            @journal.delete
            redirect to '/trees'
        else
            redirect to "/journals/#{@journal.id}"
            flash[:message] = "You do not have permission to delete!"    
        end
    end

    get '/journals/:id/edit' do
        @journal = Journal.find(params[:id])

        if Helper.clearance?(session, @journal)
            @user = Helper.current_user(session)
            erb :'journals/edit'
        else
            redirect to '/login'
        end
    end

    patch '/journals/:id/edit' do
        @journal = Journal.find(params[:id])

        if Helper.clearance?(session, @journal)
            @journal.update(params)
            @journal.activities = params[:activities] 
            @journal.save
            redirect to '/journals'
        else
            redirect to "/journals/#{@journal.id}/edit"
            flash[:message] = "Please type something to change your Tree!"
        end
    end


end