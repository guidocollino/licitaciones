# encoding: UTF-8
class Budget < ActiveRecord::Base
  attr_accessible :customer, :date, :delivery, :file_number, :general_markup, :locality, :offer, :opening, :place_of_delivery, :private_number, :street, :with_payment
  attr_accessible :budget_items_attributes
  has_many :budget_items

  accepts_nested_attributes_for :budget_items, :allow_destroy => true
  
  validates :customer, :presence => true
  
  def items_to_prawn_table
    items = [[{:content => "Item", :background_color => "000000", :text_color => "FFFFFF", :align => :center},
        {:content => "Cant", :background_color => "000000", :text_color => "FFFFFF", :align => :center},
        {:content => "Detalle", :background_color => "000000", :text_color => "FFFFFF", :align => :center},
        {:content => "Unitario", :background_color => "000000", :text_color => "FFFFFF", :align => :center},
        {:content => "Importe", :background_color => "000000", :text_color => "FFFFFF", :align => :center}]]
    budget_items.each  {
    |item|
      items.push([
        {:content => "#{item.number}", :width => 10, :align => :center },
        {:content => "#{item.quantity}", :width => 10, :align => :center },
        {:content => "#{item.detail}", :width => 325 },
        {:content => "#{ item.import_with_markup}", :align => :center},
        {:content => "#{ item.import_per_cant}", :align => :center}
      ])
    }
    items.push([
      {:content => "Son pesos: #{total_import_with_markup.to_words.capitalize}", :colspan => 3, :borders => [:top, :left, :bottom]},
      {:content => "TOTAL $", :align => :right, :borders => [:top, :bottom]},
      {:content => "#{total_import_with_markup}", :align => :center, :borders => [:top, :right, :bottom]}])
    items.push([
      {:content => "Nota: Una vez vencido el plazo de mantenimiento de oferta el mismo no se prorroga sin previo aviso",
         :colspan => 5,:align => :center}])
    items.push([
      {:content => "Manifiesto aceptar y conocer el pliego de bases y condiciones que rige el presente acto como asi tambien todas las modificaciones y me remito a la justicio de la Provincia de Buenos Aires", 
        :colspan => 5,:align => :center}])
    items
  end

  def data_to_prawn_table
    table = [
      [{:content => "Registro Proveedor Provincia de Buenos Aires N 100228", :colspan => 4, :align => :center}],
      [{:content => "Señores", :rowspan => 2},{:content => customer, :rowspan => 2}, "Exp N°" , file_number],
      ["L. Privada N°", private_number],
      [{:content => "Calle", :rowspan => 2},{:content => street, :rowspan => 2}, "Apertura" , format_opening],
      ["Manetenim. Oferta", offer],
      ["Localidad",locality, "Plazo de Entrega" , delivery],
      ["Cond. Pago", with_payment, "Lugar de entrega", place_of_delivery]
    ]
  end

  def total_import_with_markup
    if self.new_record?() then
      return 0
    else
      return BudgetItem.sum(:import, :conditions => "budget_id = #{self.id}")
    end
  end
  
  def format_date
    date.strftime("%d/%m/%Y") unless date.blank?
  end
  
  def format_opening
    opening.strftime("%d/%m/%Y %H:%M") unless opening.blank?
  end
  
  def pdf_name
    "#{customer.gsub(" ", '_')   }_#{DateTime.now.strftime("%Y%m%d%H%M%S")}"
  end
end
