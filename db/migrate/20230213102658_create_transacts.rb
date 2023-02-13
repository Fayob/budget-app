class CreateTransacts < ActiveRecord::Migration[7.0]
  def change
    create_table :transacts do |t|
      t.string :name
      t.float :amount

      t.timestamps
    end
    add_reference :transacts, :user, null: false, foreign_key: true
  end
end
