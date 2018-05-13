class Admin::ActivityLogsController < ApplicationController
  before_action :admin_required
  before_action :set_activity_log, only: :show

  def index
    @activity_logs = activity_logs.order("created_at DESC")
  end

  def show
  end

  private

  def activity_logs
    ActivityLog.includes(:user)
  end

  def set_activity_log
    @activity_log = activity_logs.find(params[:id])
  end
end