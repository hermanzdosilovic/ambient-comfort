class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def root
    @logs = Log.all.order(created_at: :desc).paginate(page: params[:page], per_page: 30)
    @latest_logs = Log.where('logs.created_at >= ?', DateTime.now.yesterday).order(created_at: :desc)
    @message = Log.last.message
    respond_to do |format|
      format.html
      format.js
    end
  end
end
