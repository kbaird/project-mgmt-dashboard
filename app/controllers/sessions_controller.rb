# frozen_string_literal: true

# Handles/persists logins
class SessionsController < ApplicationController
  # skip_before_action :require_login, only: %i[create new]

  def create
    @user = user
    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      session[:email] = @user.email
      redirect_to projects_url
    else
      flash[:notice] = 'Login is invalid!'
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have been signed out!'
    redirect_to new_session_path
  end

  def new; end

  private

  def session_params
    params.permit(:email, :password)
  end

  def user
    ProjectManager.find_by(email: session_params[:email]) || Employee.find_by(email: session_params[:email])
  end
end
