class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  require 'open-uri'
  require 'json'

  def home
  	@result = JSON.parse(open())
  end
end
