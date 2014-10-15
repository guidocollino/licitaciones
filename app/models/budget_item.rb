class BudgetItem < ActiveRecord::Base
  belongs_to :budget
  attr_accessible :detail, :markup, :number, :price, :quantity, :import
  validates_presence_of :quantity, :message => "La cantidad es obliatoria" 
  
  def coeff
    (self_markup.to_f / 100.to_f) + 1.to_f
  end
  
  def self_markup
    self.markup.blank? ? self.budget.general_markup : self.markup
  end
  
  def import_with_markup
    return (self.price * coeff).round(2)
  end
  
  def import_per_cant
    self.import_with_markup * self.quantity
  end
end
