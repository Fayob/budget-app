class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :icon

      t.timestamps
    end
    add_reference :categories, :user, null: false, foreign_key: true
  end
end
