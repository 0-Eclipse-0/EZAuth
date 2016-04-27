class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def require_admin
    redirect_to '/' unless current_user.admin?
  end
  def require_mod
    redirect_to '/' unless current_user.mod?
  end
  def require_editor
    redirect_to '/' unless current_user.editor?
  end
end