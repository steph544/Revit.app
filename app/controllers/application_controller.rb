class ApplicationController < ActionController::Base
    before_action :authenticated

    def current_user
        if session[:id]
           @user = User.find(session[:id])
        else
        
        end
    end

    

    private 

    def not_logged_in
        redirect_to "/" unless logged_in?
    end 

    def logged_in?
        !!current_user
    end

    def authenticated
        redirect_to login_path unless logged_in?
    end

  
end
