require 'bet_victor/content'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  rescue_from StatusError, with: :status_error

  private

  def status_error
    render json: { "error_message" => "We are having problems connecting to the server" }
  end
end
