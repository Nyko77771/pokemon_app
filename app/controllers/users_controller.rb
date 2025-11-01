class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token


    def signup
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "User successfully created."
        else
            render :signup, notice: "Error creating user."
        end
    end

    def signin
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
