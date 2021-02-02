class ErrorsController < ApplicationController
  after_action: "save_my_previous_url"
  def not_found
    render status: 404
  end

  def internal_server_error
    render status: 500
  end

  def save_my_previous_url
    # session[:previous_url] is a Rails built-in variable to save last url.
    session[:my_previous_url] = URI(request.referer || '').path
  end
end
