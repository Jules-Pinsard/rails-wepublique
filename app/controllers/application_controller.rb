class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :success
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :prepare_chatbox

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name avatar code])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name avatar code])
  end

  private

  def prepare_chatbox
    @chat_general = Chatroom.includes(messages: :user).first
    @message = Message.new
    @notification = Notification.where(user_id: current_user.id)
  end
end
