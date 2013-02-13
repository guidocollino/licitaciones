class CreateBudgetItems < ActiveRecord::Migration
  def change
    create_table :budget_items do |t|
      t.integer :quantity
      t.float :price
      t.integer :markup
      t.text :detail
      t.integer :number
      t.float :import
      t.references :budget

      t.timestamps
    end
    add_index :budget_items, :budget_id
  end
end
