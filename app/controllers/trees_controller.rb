require 'rack-flash'

class TreesController < ApplicationController
    enable :sessions
    use Rack::Flash

    get '/trees' do
        @trees = Tree.all
        @recent_trees = @trees.reverse
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
        if Tree.new(params).valid?
            @user = Helper.current_user(session)
            @user.trees.create(params)
            redirect to '/trees'
        else
            redirect to '/trees/new'
            flash[:message] = "Please type in a name and species!"
        end
    end

    get '/trees/:id' do
        @tree = Tree.find(params[:id])

        if Helper.is_logged_in?(session)
            erb :'/trees/show'
        else
            redirect to '/login'
        end
    end

    get '/trees/:id/edit' do
        @tree = Tree.find(params[:id])

        if Helper.clearance?(session, @tree)
            erb :'trees/edit'
        else
            redirect to '/dashboard'
        end
    end

    patch '/trees/:id/edit' do
        @tree = Tree.find(params[:id])

        if Helper.clearance?(session, @tree)
            @tree.update(params[:tree_info])
            redirect to '/trees'
        else
            redirect to "/trees/#{@tree.id}/edit"
            flash[:message] = "Please type something to change your Tree!"
        end
    end


    delete '/trees/:id/delete' do
        @tree = Tree.find(params[:id])

        if Helper.clearance?(session, @tree)
            @tree.delete
            redirect to '/dashboard'
        else
            redirect to "/trees/#{@tree.id}"
            flash[:message] = "You do not have permission to delete!"    
        end
    end


end