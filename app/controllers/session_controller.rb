class SessionController < ApplicationController
  
    def new
      @user = User.new
    end
  
    def create
        @user = User.find_by(username: params[:user][:username])
        puts params
        puts params[:user]
        @user = @user.try(:authenticate, params[:user][:password])
      if @user
        session[:user_id] = @user.id
        redirect_to '/'
      else
        redirect_to 'session#new'
      end
    end
  
    def destroy
      session.delete :user_id
      redirect_to '/'
    end
end