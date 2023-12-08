class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Notification.create(user_id: params[:user_id]) if params[:user_id] != current_user
  end

  def destroy
    Notification.where(user_id: current_user.id).destroy_all
  end
end
