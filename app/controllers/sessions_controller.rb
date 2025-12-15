# Class for managing user sessions
class SessionsController < ApplicationController
    # Used to check authenticity
    skip_before_action :verify_authenticity_token

    # Method to render login page
    def login
    end

    # Method to create a new session
    def create
        # Find user by email
        @user = User.find_by_email(params[:session][:email])
        # If user exists and password is correct
        if @user && @user.authenticate(params[:session][:password])
            # Assign user id to session
            session[:user_id] = @user.id
            redirect_to '/', notice: "Successfully logged in"
        else
            redirect_to login_path, notice: "Email or Password are incorrect"
        end

    end

    # Method to destroy a session
    def destroy
        # Clear user id from session
        session[:user_id] = nil
        redirect_to '/'
    end
end
