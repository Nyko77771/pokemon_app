class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def signup
        @user = User.new
    end

    def create
        @user = User.new(user_params_and_password_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "User successfully created."
        else
            render :signup, notice: "Error creating user."
        end
    end

    def destroy
        Rails.logger.info("Deleting user with ID: #{params[:id]}")
        @user = User.find(params[:id])
        @user.destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "User deleted."
    end

    def edit
        @user = User.find(params[:id])
        if @user
            render :edit
        else
            redirect_to root_path, notice: "User not found."
        end
    end

    def update
        @user = User.find(params[:id])

        if params[:user][:password].present?
            if @user.update(password_params)
                redirect_to profile_path, notice: "Password successfully updated."
            else
                render :edit
            end
        elsif params[:user][:email].present?
            if @user.update(user_params)
                redirect_to profile_path, notice: "Email successfully updated."
            else
                render :edit
            end
        else
            render :edit
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email)
    end

    def user_params_and_password_params
        params.require(:user).permit(:first_name, :last_name, :email,:password, :password_confirmation)
    end

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end
