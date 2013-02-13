class BudgetItem < ActiveRecord::Base
  belongs_to :budget
  attr_accessible :detail, :markup, :number, :price, :quantity, :import
  validates_presence_of :quantity, :message => "La cantidad es obliatoria" 
end
