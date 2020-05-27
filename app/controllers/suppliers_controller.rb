class SuppliersController < ApplicationController 
    before_action :current_supplier, only: [:show, :orders_list]
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def index 
        @user=User.find(session[:id])
        @supplier=Supplier.new
        @suppliers=Supplier.all 
    end 
    
    def new 
        @supplier=Supplier.new
    end 

    def create
        @user=User.find(session[:id]) 
        @supplier=Supplier.new(suppliers_params)
            if @supplier.valid? 
               @supplier.save   
            redirect_to @supplier
        else 
            flash[:errors]=@supplier.errors.full_messages 
            redirect_to "/suppliers/new"
        end 
    end 

    def show 
    end 

    def current_supplier
        @supplier=Supplier.find(params[:id])
    end 

    def current_user 
        @user=User.find(params[:id])
    end 

    def orders_list 
    end 

    private 
    def require_login
        return head(:forbidden) unless session.include? :id
    end

    def suppliers_params
        params.require(:supplier).permit(:name, :address, :phone)
    end   
    end 