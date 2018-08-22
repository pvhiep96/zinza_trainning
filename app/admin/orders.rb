ActiveAdmin.register Order do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  controller do |order|
    def show
      order = Order.find_by(id: params[:id] )  
      respond_to do |format|
        format.html
        format.csv { send_data order.order_details.to_csv, filename: "details-#{Date.today}.csv" }
      end
    end
  end

  show do |order|
    panel 'Order details' do
      attributes_table_for order, :user_id, :total, :status, :created_at
    end

    panel('Items') do
      table_for(order.order_details) do
        column 'Name' do |i|
          i.product.name
        end
        column :quantity
        column 'Price' do |i|
          i.product.price
        end
      end
    end
    text_node link_to('Download CSV', admin_order_path(resource.id, format: :csv))
  end
  csv do
    column :id
    column(:user){|order| order.user.name}
    column :total
    column :status
    column :created_at
    column :updated_at
  end
end
