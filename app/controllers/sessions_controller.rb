class SessionsController < ApplicationController
  skip_before_action :authenticated, only: [:new, :create]

    def new
    end

    def create
    #byebug
    @user = User.find_by(username: params[:username])

        if params[:username] == " "
           
            flash[:errors] = @user.errors.full_messages
            redirect_to '/login'

        elsif @user && @user.authenticate(params[:password])
            session[:id] = @user.id
            session[:current_user] = User.find(@user.id)
            redirect_to @user
        elsif @user == nil
            flash.now[:error] = 'Wrong username or password'
           redirect_to '/login'
        else
           redirect_to '/login'
        end
    end

    def destroy
        session.delete(:id)
        #session.delete(:current_user)
        redirect_to "/login"
        # byebug
    end
end

