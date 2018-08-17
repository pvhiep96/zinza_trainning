class RenameNameToPictureUrlInPicture < ActiveRecord::Migration[5.1]
  def change
    rename_column :pictures, :name, :picture_url
    # Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
