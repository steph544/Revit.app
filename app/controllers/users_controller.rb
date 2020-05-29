class UsersController < ApplicationController
    before_action :current_user, only: [:destroy, :show]
    skip_before_action :authenticated, only: [:new, :create, :welcome]

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
            redirect_to new_user_path
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
        #orders
        @orders_monthly_count = Order.group(:product_id){ |t| t.start_date.strftime("%B/%Y")}.count
      
        @orders_year_to_date_count = Order.group(:product_id) {|t| }
        @total_orders = Order.all.count
        #average_total = 
        
        #for products
        @monthly_sold = Product.where("created_at >= ?", Time.now.beginning_of_month).sum(:cost)
        #yearly_sold = 
        #average_retail_price =         
    end 

    def destroy
        @user.destroy
        redirect_to "/"
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
