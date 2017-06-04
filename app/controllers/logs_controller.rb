class LogsController < ActionController::Base
    def create
        log = Log.new(log_params)
        if log.save
            render json: log
        else
            render json: log.errors
        end
    end

    def delete_all
        Log.delete_all
        redirect_to root_path
    end

    private

    def log_params
        params.require(:log).permit(
            :created_at,
            :temperature,
            :moisture,
            :pressure,
            :brightness,
            :noise
        )
    end
end