class BudgetItem < ActiveRecord::Base
  belongs_to :budget
  attr_accessible :detail, :markup, :number, :price, :quantity
  validates_presence_of :quantity, :message => "La cantidad es obliatoria" 
end
