class LogsController < ActionController::Base
    before_action :authenticate_user, only: [:create]
    http_basic_authenticate_with(
        name: Rails.application.secrets.username,
        password: Rails.application.secrets.password,
        only: [:delete_all]
    )

    def create
        log = Log.new(log_params)
        if log.save
            render json: log, status: :created
        else
            render json: log.errors, status: :unprocessable_entity
        end
    end

    def delete_all
        Log.delete_all
        redirect_to root_path
    end

    private

    def authenticate_user
        return unless Rails.application.secrets.api_key.presence
        password_correct = ActiveSupport::SecurityUtils.secure_compare(
            ::Digest::SHA256.hexdigest(Rails.application.secrets.api_key),
            ::Digest::SHA256.hexdigest(request.headers['X-Auth-Token'].to_s)
        )
        head :unauthorized unless password_correct
    end

    def log_params
        params.require(:log).permit(
            :created_at,
            :temperature,
            :moisture,
            :pressure,
            :brightness,
            :noise,
            :message
        )
    end
end