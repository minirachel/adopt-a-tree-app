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
        if User.new(params).valid?
            @user = User.create(params)
            session[:user_id] = @user.id
            redirect to '/dashboard'
        else
            redirect to '/signup'
            flash[:message] = "This email is Useralready associated with an account. Please login."
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
            @journals = Journal.all

            erb :'users/show'
        else
            redirect to '/login'
        end
    end
end