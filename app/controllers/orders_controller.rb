class OrdersController < ApplicationController
  before_action :user_signed_in?, only: %i[edit update show destroy]
  before_action :set_order, except: %i[edit checkout index]
  before_action :order_params, only: [:create]
  before_action :order_details, only: [:detail]
  def index
    # @search = Order.ransack(params[:q])
    @orders = Order.where(status: 'checkout').order(created_at: :desc)
  end

  def create; end

  def new; end

  def edit; end

  def show; end

  def checkout
    @order = Order.find_by(id: params[:id])
    # TODO: validate truong hop ko tim thay order
    @order.update_attribute(:total, @order.total_price)
    @order.checkout!
    session.delete 'order_id'
    NotifierMailer.order_received(@order).deliver
    redirect_to products_path
  end

  def destroy
    @order = Order.find_by params[:id]
    @order.order_details.destroy
    session.delete 'order_id'
    redirect_to products_path
  end

  def detail; end

  def showorder; end

  private

  def order_params
    params.require(:order).permit(:id, :user_id, :total)
  end

  def set_order
    @order = Order.find_by(id: session['order_id'])
    return unless @order.nil?
    render 'shared/_404'
  end

  def order_details
    @order = Order.find_by(id: params[:id])
    render 'shared/_404' if @order.nil?
  end
end
