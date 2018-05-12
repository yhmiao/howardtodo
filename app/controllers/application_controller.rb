class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
  after_action :log_activity

  private

  def log_activity
    if current_user
      log_params = {
        controller: controller_name,
        action:  		action_name,
        params: 		params.permit(params.keys).to_h.except(*%w(controller action)).presence
      }

      current_user.activity_logs.create(log_params)
    end
  end
end
