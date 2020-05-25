class OrdersController < ApplicationController
    before_action :current_order, only: [:update]
    before_action :current_user, only: [:index]
    before_action :require_login

    def index 
        @user=current_user 
    end 

    def show 
        if !@order 
            puts "You have no orders"
        else 
            current_order 
            render :show 
        end
    end 

    def current_order 
        @order=Order.find[params[:id]]
    end 

    def current_user 
        @user=User.find(session[:id])
    end 

    private 
    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
