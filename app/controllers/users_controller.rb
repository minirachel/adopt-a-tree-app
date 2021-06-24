require 'rack-flash'

class UsersController < ApplicationController
    enable :sessions
    use Rack::Flash

    get '/signup' do
        if !Helper.is_logged_in?(session)
            erb :'users/signup'
        else
            redirect to '/dashboard'
        end
    end

    post '/signup' do
        @user = User.new(params)

        if @user.save
            session[:user_id] = @user.id
            redirect to '/dashboard'
        else
            # flash[:message] = "This email is User already associated with an account. Please login."
            flash[:message] = @user.errors.full_messages.join(", ")
            
            redirect to '/signup'
        end
    end

    get '/login' do
        if !Helper.is_logged_in?(session)
            erb :'users/login'
        else 
            redirect to '/dashboard'
        end
    end

    post '/login' do
        @user = User.find_by(:username => params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to '/dashboard'
        else
            flash[:message] = "This username or password is incorrect."
            redirect to '/login'
        end
    end

    get '/logout' do
        if Helper.is_logged_in?(session)
            session.destroy
            redirect to '/login'
        else
            redirect to '/'
        end
    end

    get '/dashboard' do
        if Helper.is_logged_in?(session)
            @user = Helper.current_user(session)
            @trees = Tree.all
            @recent_trees = @trees.reverse
            @journals = Journal.all

            erb :'users/show'
        else
            redirect to '/login'
        end
    end
end