# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordNotDestroyed, with: :record_not_found
  rescue_from ActionController::RoutingError, with: :record_not_found

  protect_from_forgery with: :exception

  def record_not_found
    render file: Rails.root.join("public/404.html"), status: :not_found, layout: false
  end
end
