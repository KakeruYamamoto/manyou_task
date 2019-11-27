module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def render_page
    unless logged_in?
      render new_session_path, notice: 'ログインして下さい'
    end
  end

end
