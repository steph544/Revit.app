class UsersController < ApplicationController

    skip_before_action :authenticated, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
    # byebug
    @user = User.new(user_params)

        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def show
        # byebug
        if session[:user_id] == params[:id].to_i
            @user = User.find(session[:user_id])
        else
            redirect_to @user #"/users/#{session[:user_id]}"
        end
    end

    def bookkeeping 
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


    private 
    def require_login
        return head(:forbidden) unless session.include? :id
    end

end
