# frozen_string_literal: true

class ApplicationController < ActionController::API
  # Adds a few additional behaviors into the application controller
  include ActionController::MimeResponds
  include Blacklight::Controller
  layout :determine_layout if respond_to? :layout

  protect_from_forgery with: :exception
end
