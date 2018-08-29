class ProductsController < ApplicationController
  # load_and_authorize_resource
  before_action :set_product, only: %i[edit update show destroy]
  before_action :user_signed_in?, only: %i[edit update show destroy create]
  before_action :correct_user, only: %i[edit update]
  def index
    @search = current_user.products.ransack(params[:q])
    @products = @search.result.includes(:category).page(params[:page]).per(9)
    # @search.build_condition
    @categories = Category.all
  end

  def show
    @categories = Category.all
    @product = Product.find_by(id: params[:id])
    render 'public/404' if @product.nil?
  end

  def new
    @product = current_user.products.build
    @product.pictures.build
  end

  def edit; end

  def create
    @product = current_user.products.build product_params

    if @product.save
      flash[:success] = 'product created!'
      redirect_to products_path
    else
      render :new
    end
  end

  def update
    return unless @product.update_attributes product_params
    flash[:success] = 'product updated'
    redirect_to @product
  end

  def destroy
    return unless current_user != @product.user
    @product.destroy
    redirect_to products_url
    flash[:success] = 'destroy success'
  end

  def showall
    @search = Product.ransack(params[:q])
    @products = @search.result.includes(:category).page(params[:page]).per(9)
    # @search.build_condition
    @categories = Category.all
  end

  private

  def product_params
    params.require(:product).permit(:id, :name, :price, :description, :status, :quantity, :category_id,
                                    pictures_attributes: %i[id picture_url _destroy])
  end

  def set_product
    @product = Product.find_by(id: params[:id])
    render 'shared/_404' if @product.nil?
  end

  def correct_user
    @product = Product.find_by(id: params[:id])
    redirect_to(root_url) unless current_user == @product.user
  end
end
