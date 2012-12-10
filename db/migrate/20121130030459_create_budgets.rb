class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :customer
      t.string :street
      t.string :locality
      t.string :with_payment
      t.string :file_number
      t.string :private_number
      t.string :opening
      t.date :date
      t.string :offer
      t.string :delivery
      t.string :place_of_delivery
      t.integer :general_markup

      t.timestamps
    end
  end
end
