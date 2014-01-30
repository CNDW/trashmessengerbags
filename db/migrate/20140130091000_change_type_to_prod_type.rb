class ChangeTypeToProdType < ActiveRecord::Migration
  def change
  	rename_column :products, :type, :prod_type
  end
end
