ActiveAdmin.register Product do
  permit_params :id, :name, :category_id, :description, :price, :quantity, pictures_attributes: %i[picture_url id]

  controller do
    def create
      @product = current_user.products.build(permitted_params[:product])
      redirect_to admin_products_path if @product.save
    end

    def show
      @product = Product.find_by(id: params[:id])
    end
  end
  show do |product|
    panel 'Product details' do
      attributes_table_for product, :user_id, :total, :status, :created_at
    end

    panel('Items') do
      table_for(product.pictures) do
        column 'Picture' do |i|
          image_tag i.picture_url, class: 'my_image_size'
        end
      end
    end
  end
  form do |f|
    f.inputs 'New product' do
      f.input :category
      f.input :name
      f.input :price
      f.input :quantity
      f.input :description
      f.inputs do
        f.has_many :pictures, heading: 'Picture', allow_destroy: true, new_record: true do |a|
          a.input :picture_url
        end
      end
    end
    actions
  end
end
