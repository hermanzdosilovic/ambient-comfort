class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  http_basic_authenticate_with(
    name: Rails.application.secrets.username,
    password: Rails.application.secrets.password
  )

  def root
    @logs = Log.all.order(created_at: :desc)
  end
end
