class Budget < ActiveRecord::Base
  attr_accessible :customer, :date, :delivery, :file_number, :general_markup, :locality, :offer, :opening, :place_of_delivery, :private_number, :street, :with_payment
  attr_accessible :budget_items_attributes
  has_many :budget_items
  
  accepts_nested_attributes_for :budget_items, :allow_destroy => true
end
