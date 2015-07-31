class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_action :set_calendar
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end
  
  protected
  
  def set_calendar
    if params[:date]
      @events = Event.where(date: params[:date])
      @calendar_events = Event.all
    else
      @events = @calendar_events = Event.all
    end
    
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password,
      :password_confirmation, :remember_me, :avatar, :avatar_cache) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache) }

    #devise_parameter_sanitizer.for(:sign_up) << :name
    #devise_parameter_sanitizer.for(:account_update) << :name
  end
end