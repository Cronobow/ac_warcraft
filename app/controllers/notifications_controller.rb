class NotificationsController < ApplicationController
  before_action :set_notifications

  def index
  end

  def mark_as_read
    @notification = Notification.find(params[:id])
    @notification.update(read_at: Time.zone.now)
    render json: {success: true}
  end

  def mark_as_checked_all
    @notifications = Notification.where(recipient: current_user).unchecked
    @notifications.update_all(checked_at: Time.zone.now)
    render json: {success: true}
  end
  def mark_as_read_all
    @notifications = Notification.where(recipient: current_user).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end

  private

  def set_notifications
    @notifications = Notification.where(recipient: current_user)
  end

end
