class ProductsController < ApplicationController 
    before_action :current_product, only: [:show, :orders_list]
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

    def show 
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