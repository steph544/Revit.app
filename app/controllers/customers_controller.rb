class CustomersController < ApplicationController
    before_action :current_customer, only: [:show, :orders_list]
    before_action :require_login


    def index
        @user=session[:user_id]
    end 

    def show 
      
    end 

    def orders_list 
    end 

    def current_customer 
        @customer=Customer.find(params[:id])
    end 

    def current_user 
        @user=User.find(params[:id])
    end 

    private 
    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
