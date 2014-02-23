class CreateCustomFields < ActiveRecord::Migration
  def change
    create_table :custom_fields do |t|
      t.string :name
      t.string :field_type
      t.references :fieldable, index: true, polymorphic: true
      t.boolean :required
      t.boolean :public

      t.timestamps
    end
  end
end
