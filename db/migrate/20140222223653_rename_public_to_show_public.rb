class RenamePublicToShowPublic < ActiveRecord::Migration
  def change
  	rename_column :custom_fields, :public, :show_public
  end
end
