class CreateOptionFields < ActiveRecord::Migration
  def change
    create_table :option_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.belongs_to :option_type, index: true

      t.timestamps
    end
  end
end
