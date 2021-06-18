require 'rack-flash'

class TreesController < ApplicationController
    enable :sessions
    use Rack::Flash

    get '/trees' do
        @trees = Tree.all
        erb :'trees/index'
    end

    get '/trees/new' do
        if Helper.is_logged_in?(session)
            erb :'/trees/new'
        else
            redirect to '/login'
        end
    end

    post '/trees' do
        if params[:nickname] != "" && params[:species] != ""
            @user = Helper.current_user(session)
            @user.trees.create(params)
            redirect to '/trees'
        else
            redirect to '/trees/new'
            flash[:message] = "Please type in a name and species!"
        end
    end

    get '/trees/:id' do
        if Helper.is_logged_in?(session)
            @tree = Tree.find(params[:id])
            erb :'/trees/show'
        else
            redirect to '/login'
        end
    end

    delete '/trees/:id/delete' do
        @tree = Tree.find(params[:id])

        if Helper.current_user(session).id == @tree.user_id
            @tree.delete
            redirect to '/trees'
        else
            redirect to "/trees/#{@tree.id}"
            flash[:message] = "You do not have permission to delete!"    
        end
    end

    get '/trees/:id/edit' do
        if Helper.is_logged_in?(session)
            @tree = Tree.find(params[:id])
            erb :'/trees/edit'
        else
            redirect to '/login'
        end
    end

    patch '/trees/:id/edit' do
        @tree = Tree.find(params[:id])

        if params[:nickname] != "" && params[:species] != ""
            # @user = Helpers.current_user(session)
            # @user.tweets.create(params)
            @tree.update(params)
            redirect to '/trees'
        else
            redirect to "/trees/#{@tree.id}/edit"
            flash[:message] = "Please type something to change your Tree!"
        end
    end



end