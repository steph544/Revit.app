class OrdersController < ApplicationController
    before_action :current_order, only: [:update, :show]
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def index 
        @orders=Order.all 
        @user=current_user 
        @customers=Customer.all 
        @products=Product.all 
    end 

    def show 
    end 
    
    def new 
        @customers=Customer.all 
        @products=Product.all 
        @order=Order.new 
        @order.build_customer
        @users=User.all 
    end 

    def create 
        @user=User.find(session[:id])
        @order=Order.new(order_params)
        @order.user=@user 
        if @order.valid? 
            @order.save 
            @user.orders << @order
            redirect_to "/orders"
        else 
            flash[:errors]=@customer.errors.full_messages 
            redirect_to "/orders/new"
        end 
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
        params.require(:order).permit(:user_id, :customer_id,  :duedate, :paid, product_ids:[])
    end 

end
