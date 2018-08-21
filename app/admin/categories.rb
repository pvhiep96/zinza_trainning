ActiveAdmin.register Category do
  permit_params :name
  controller do
    def create
      @category = current_user.categories.build(permitted_params[:category])
      redirect_to admin_categories_path if @category.save
    end
  end
  form do |f|
    f.inputs 'New product' do
      f.input :name
    end
    actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # menu parent: "Blog"
end
