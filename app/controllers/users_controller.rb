class UsersController < ApplicationController
    before_action :not_logged_in, only: [:show, :bookeeping, :account, :destroy]
    before_action :current_user, only: [:destroy, :show]
    skip_before_action :authenticated, only: [:new, :create, :welcome, :create, :show]

    def new
        @user = User.new
    end

    def create
    # byebug
    @user = User.new(user_params)

        if @user.valid?
            @user.save
            session[:id] = @user.id
            redirect_to "/home"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to "/"
        end
    end

    def show
        # byebug
        if session[:id] == params[:id].to_i
            @user = User.find(session[:id])
        else
            redirect_to @user #"/users/#{session[:user_id]}"
        end
    end

    def bookkeeping 
        @orders=@user.orders
        @products=@user.products
        @suppliers=Supplier.all 
        @customers=@user.customers 
    end 

    def account 
    end 

    # def current_user 
    #     @user = User.find(session[:id])
    # end 

    def destroy 
        @user.destroy 
        redirect_to "/"
      
        #total_number_sales_per_order = @order.products.each do |p| 
        #    p.name.count
        #end 
           
        
      #def total_amount_sales_per_order 
        #total = 0 
        #@product.orders.each do |order|
       #          total += order.
      
          
      #def cost_of_good_sold 
     
            
           # profit
            
    end 

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :phone, :username, :password, :password_confirmation)
    end
        
    def require_login
        return head(:forbidden) unless session.include? :id
    end

end
