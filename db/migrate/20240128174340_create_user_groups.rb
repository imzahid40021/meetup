class CreateUserGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :user_groups do |t|
      t.references :user, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.string :role_name, null: false

      t.timestamps
    end
  end
end
