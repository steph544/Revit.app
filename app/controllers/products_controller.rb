class ProductsController < ApplicationController 
    before_action :current_product, only: [:show, :orders_list, :destroy, :update, :edit]
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def index 
        @user=User.find(session[:id])
        @products=Product.all 
        @suppliers=Supplier.all
        @product=Product.new 
    end 
    
    def new 
        @product=Product.new
    end 

    def create
        @user=User.find(session[:id]) 
        @product=Product.new(products_params)
            if @product.valid? 
               @product.save  
            redirect_to @product
        else 
            flash[:errors]=@product.errors.full_messages 
            redirect_to "/products/new"
        end 
    end 
    
    def destroy 
        @product.destroy 
        redirect_to "/products"
    end 

    def show 
        @suppliers=Supplier.all
    end 


    def update 
        if @product.update(products_params)
            redirect_to @product
        else 
            flash[:errors]=@product.errors.full_messages
            redirect_to "/products/#{@product.id}/edit"
        end 
    end 

    def patch 
    end 

    def current_product
        @product=Product.find(params[:id])
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

    def products_params
        params.require(:product).permit(:name, :cost, :retail_price, :url, :supplier_id)
    end   
    end 