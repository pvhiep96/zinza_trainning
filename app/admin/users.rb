ActiveAdmin.register User do
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
  csv do
    column :email
    column :name
    column :created_at
    column :confirmed_at
    # column(:author) { |post| post.author.full_name }
    # column('bODY', humanize_name: false) # preserve case
  end
end
