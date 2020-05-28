class OrdersController < ApplicationController
    before_action :current_order, only: [:show, :edit, :destroy, :update]
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def index 
        @orders=Order.all 
        @user=current_user 
        @customers=Customer.all 
        @products=Product.all 
    end 

    def show 
        @user=User.find(session[:id])
        @customers=@user.customers
        @products=@user.products 

    end 
    
    def new 
        @customers=Customer.all 
        @products=Product.all 
        @order=Order.new 
        @order.build_customer
        @users=User.all 
    end 

    def edit
        @customers=@user.customers 
        @orders=Order.all 
        @user=current_user 
        @products=Product.all 
    end 

    def create 
        @user=User.find(session[:id])
        @order=Order.new(order_params)
        @order.user=@user 
        if @order.valid? 
            @order.save 
            @user.orders << @order
            redirect_to "/orders/#{@order.id}"
        else 
            flash[:errors]=@customer.errors.full_messages 
            redirect_to "/orders/new"
        end 
    end 

    def update 
        if @order.update(order_params)
            redirect_to @order 
        else 
            flash[:errors]=@order.errors.full_messages
            redirect_to "/customers/#{@order.id}/edit"
        end 
    end 

    def patch 
    end 

    def destroy 
        @order.destroy 
        redirect_to "/orders"
    end 


    def current_order 
        @order=Order.find(params[:id])
    end 

    def current_user 
        @user=User.find(session[:id])
    end 

    private 
    def require_login
        return head(:forbidden) unless session.include? :id
    end

    def order_params
        params.permit(:user_id, :customer_id,  :duedate, :paid, product_ids:[])
    end 

end
