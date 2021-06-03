class ApplicationController < ActionController::Base
    before_action :current_user

    private 

    def current_user 
        User.find_by(id:session[:user_id])
    end

    def loggen_in?
        !!current_user
    end

    def verified_user
        redirect_to '/' unless loggen_in?
    end
end
