class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_url, :alert => exception.message
end

def search
  if params[:search]
    @properties = Property.search(params[:search])
  else
    @properties = Property.all
  end
end

end
