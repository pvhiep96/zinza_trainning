class PicturesController < ApplicationController
  load_and_authorize_resource
  before_action :picture_params, only: %i[edit update show destroy]
  before_action :user_signed_in?, only: %i[edit update show destroy]

  def index
    # @pictures = Picture.all
  end

  def show; end

  def create
    # @picture = current_user.product.build(picture_params)
    # @picture.user_id = current_user.id
    # if @picture.save
    #   flash[:success] = "picture created"
    #   redirect_to @product
    # end
  end

  def new
    # @picture = Picture.new
  end

  def edit; end

  def update; end

  def destoy; end

  private

  def picture_params
    params.require(:picture).permit(:picture_url, :product_id, :pictures_attributes[:picture_url])
  end

  def set_picture
    @picture = Picture.find_by(id: params[:id])
  end
end
