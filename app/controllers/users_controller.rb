# frozen_string_literal: true

# Class for managing user actions.
class UsersController < ApplicationController
  # Used for token-based authentication.
  skip_before_action :verify_authenticity_token

  # Method for user signup.
  def signup
    @user = User.new
  end

  # Method for creating a new user.
  def create
    # Create new user with provided parameters.
    @user = User.new(user_params_and_password_params)
    # If user saves successfully, set session and redirect to root path.
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User successfully created.'
    else
      # Else render signup view with error notice.
      render :signup, notice: 'Error creating user.'
    end
  end

  # Method for deleting a user.
  def destroy
    # Find user by ID and destroy the record.
    @user = User.find(params[:id])
    @user.destroy
    # Clear session of user id
    session[:user_id] = nil
    redirect_to root_path, notice: 'User deleted.'
  end

  # Method for editing user details.
  def edit
    # Find user by ID and render edit view.
    @user = User.find(params[:id])
    if @user
      render :edit
    else
      redirect_to root_path, notice: 'User not found.'
    end
  end

  # Method for updating user details.
  def update
    # Find user by ID.
    @user = User.find(params[:id])

    # If password is present in params, update password.
    if params[:user][:password].present?
      if @user.update(password_params)
        redirect_to profile_path, notice: 'Password successfully updated.'
      else
        render :edit
      end
    # Else if email is present in params, update email.
    elsif params[:user][:email].present?
      if @user.update(user_params)
        redirect_to profile_path, notice: 'Email successfully updated.'
      else
        render :edit
      end
    # Or redirect to edit
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      redirect_to profile_path
    else
      redirect_to root_path, notice: 'User not found.'
    end
  end

  # Private methods for checking permitted parameters.
  private

  # Used for updating user details except password.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  # Used during initial user creation.
  def user_params_and_password_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  # Used for updating password only.
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
