
class ApplicationController < ActionController::API
  # Adds a few additional behaviors into the application controller
  include ActionController::MimeResponds
  include Blacklight::Controller
  layout :determine_layout if respond_to? :layout

end
