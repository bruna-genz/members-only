# frozen_string_literal: true

module SessionsHelper
  def sign_in(user)
    remember_token = User.new_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_digest, remember_token)
    current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= User.find_by(remember_digest: cookies.permanent[:remember_token]) if cookies.permanent[:remember_token]
  end

  def log_out
    cookies.delete(:remember_token)
    current_user = nil
  end

  def current_user?(user)
    user == @current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def redirect_back_or(default)
    redirect_to(cookies[:forwarding_url] || default)
    cookies.delete(:forwarding_url)
  end

  def store_location
    cookies[:forwarding_url] = request.original_url if request.get?
  end
end
