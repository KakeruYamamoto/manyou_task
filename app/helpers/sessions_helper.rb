# frozen_string_literal: true

module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def render_page
    render new_session_path, notice: '不正アクセスです。ログインして下さい' unless logged_in?
  end
end
