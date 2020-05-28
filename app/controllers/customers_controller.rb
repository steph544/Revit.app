class CustomersController < ApplicationController
    before_action :current_customer, only: [:show, :orders_list, :edit, :update, :destroy]
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]


    layout "application"


    def index
        @user=User.find(session[:id])
         @customer=Customer.new
    end 

    def show 
        @user = User.find(session[:id])
    end 

    def orders_list 
    end 

    def new 
        @customer=Customer.new
    end 

    def create
        @user=User.find(session[:id]) 
        @customer=Customer.new(customers_params)
            if @customer.valid? 
            @customer.save  
            @customer.users << @user 
            redirect_to @customer
        else 
            flash[:errors]=@customer.errors.full_messages 
            redirect_to "/customers"
        end 
    end 

    def update 
        if @customer.update(customers_params)
            redirect_to @customer 
        else 
            flash[:errors]=@customer.errors.full_messages
            redirect_to "/customers/#{@customer.id}/edit"
        end 
    end 

    def patch 
    end 

    def destroy 
        @customer.destroy 
        redirect_to "/customers"
    end 

    def current_customer 
        @customer=Customer.find(params[:id])
    end 

    def current_user 
        @user = User.find(session[:id])
    end 

    private 
    def require_login
        return head(:forbidden) unless session.include? :id
    end

    def customers_params
        params.require(:customer).permit(:first_name, :last_name, :email, :address, :city, :state, :url, :phone)
    end 
end
