class CreateCategoryTransacts < ActiveRecord::Migration[7.0]
  def change
    create_table :category_transacts do |t|

      t.timestamps
    end
    add_reference :category_transacts, :transact, null: false, foreign_key: true
    add_reference :category_transacts, :category, null: false, foreign_key: true
  end
end
