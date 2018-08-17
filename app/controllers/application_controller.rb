class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :edit_user, if: :devise_controller?
  before_action :session_cart

  protected

  def session_cart
    return unless current_user
    if session['order_id']
      @order = Order.find_by(id: session['order_id'])
    else
      last_empty_order = current_user.orders.includes(:order_details).select(&:order_empty?).last
      @order = last_empty_order || current_user.orders.create
      session['order_id'] = @order.id
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def edit_user
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
