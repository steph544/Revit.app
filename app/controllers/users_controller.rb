class UsersController < ApplicationController
    layout "application"
    before_action :require_login
    before_action :current_user, only: [:show] 
    skip_before_action :require_login, only: [:new, :create]
    
    def index 
        @users=User.all
    end 

    def welcome
    end 

    def new
        @user=User.new
    end 

    def show 
    end 

    def create 
        @user=User.new(user_params)
        if @user.valid? 
            @user.save 
            redirect_to "/home"
            session[:id]=@user.id 
        else 
            flash[:errors]=@user.errors.full_messages 
            redirect to "/users/new"
        end 
    end 

    def current_user 
        @user=User.find(params[:id])
    end 

    def bookkeeping 
    end 

    private
    def user_params 
        params.require(:user).permit(:first_name, :last_name, :email, :phone)
    end

    private 
    def require_login
        return head(:forbidden) unless session.include? :id
    end
end
