class CreateCustomizers < ActiveRecord::Migration
  def change
    create_table :customizers do |t|
      t.belongs_to :customizable, index: true
      t.integer :option_id

      t.timestamps
    end
  end
end
