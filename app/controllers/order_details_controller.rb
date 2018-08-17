class OrderDetailsController < ApplicationController
  before_action :user_signed_in?, only: %i[edit update show destroy]
  before_action :gets_order, only: %i[new create show update]
  before_action :gets_order_detail, only: [:destroy]
  def index; end

  def show; end

  def new; end

  def create
    @order_detail = @order.order_details.find_by(product_id: params[:order_detail][:product_id])
    if @order_detail
      @order_detail.update(quantity: @order_detail.quantity.to_i + params[:order_detail][:quantity].to_i)
    else
      @order_detail = @order.order_details.create(order_details_params)
    end
  end

  def edit; end

  def update
    @order.update_attributes(order_details_params)
  end

  def destroy
    @order_detail.destroy
    respond_to do |format|
      format.html { redirect_to order_path @order }
      format.json { head :no_content }
    end
  end

  def update_quantity
    @order_details = OrderDetail.find_by(id: params[:id])
    @order_details.update(quantity: params[:order_detail][:quantity])
  end

  private

  def order_details_params
    params.require(:order_detail).permit(:name, :price, :product_id, :quantity)
  end

  def gets_order_detail
    @order_detail = OrderDetail.find_by(id: params[:id])
    render 'shared/_404' if @order_detail.nil?
  end

  def gets_order
    @order = Order.find_by(id: session['order_id'])
    redirect_to products_path unless @order
  end
end
