class ChangeOpeningToDate < ActiveRecord::Migration
  def up
    change_column :budgets, :opening, :datetime
  end

  def down
    change_column :budgets, :opening, :string
  end
end
