class UsersController < ApplicationController

    skip_before_action :authenticated, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
    # byebug
    @user = User.new(user_params)

        if @user.valid?
            @user.save
            redirect_to @user
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def show
        # byebug
        if session[:user_id] == params[:id].to_i
            @user = User.find(session[:user_id])
        else
            redirect_to @user #"/users/#{session[:user_id]}"
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :phone, :username, :password, :password_confirmation)
    end

end
