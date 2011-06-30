class ApplicationController < ActionController::Base
before_filter :authenticate_user!, :except => []
  # Redirect user to root unless the return to attribute is set
  # @param resource takes the model through which the sign in is occuring
  def after_sign_in_path_for(resource)
    (session[:"user.return_to"].nil?) ? "/" : session[:"user.return_to"].to_s
  end

  # When a user doesn't have permission to the page, redirect to root and display error message
  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] = exception.message
    redirect_to root_url
  end
  protect_from_forgery
end
