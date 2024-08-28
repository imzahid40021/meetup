class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.boolean :is_deleted, index: true, default: false

      t.timestamps
    end
  end
end
