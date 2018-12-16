class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale
  before_filter :check_authentication
  before_filter :set_user
  helper_method :tr

  private

  def set_locale
    session["locale"] = params["locale"] if params["locale"] && ["en", "es"].include?(params["locale"])
    if session["locale"] && ["en", "es"].include?(session["locale"])
      I18n.locale = session["locale"]
    else
      I18n.locale = "en"
    end
    session["tr"] = params["tr"] if params["tr"]
  end

  def check_authentication
    if session[:username].blank?
      redirect_to controller: "welcome", action: "login", method: "get"
    end
  end

  def set_user
    if session[:username].present?
      @user = User.where(username: session[:username]).first
    end
  end

  def check_delete_permission
    return if @user && @user.can_delete_record?
    return head :unauthorized
  end

  def tr(string)
    # "{#{I18n.t(string)}}"
    I18n.t(string)
  end
end
