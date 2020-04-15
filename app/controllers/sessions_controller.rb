# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render 'new'
     end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com', user_name: 'ゲストユーザー') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.created_at = Time.now
    end
    session[:user_id] = user.id
    redirect_to tasks_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
