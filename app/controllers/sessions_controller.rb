class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def login
    end

    def create
        @user = User.find_by_email(params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            redirect_to '/', notice: "Successfully logged in"
        else
            redirect_to login_path, notice: "Email or Password are incorrect"
        end

    end


    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end
end
