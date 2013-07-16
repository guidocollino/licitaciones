prawn_document(:filename=> @budget.pdf_name, :page_size=> "A4", :top_margin => 132, :left_margin => 10) do |pdf|
	data_table = @budget.items_to_prawn_table

	pdf.repeat(:all) do
	pdf.canvas do
		pdf.move_down(10)
	  pdf.span(50, :position => 170) do
   		pdf.text "Sucesión de", :size => 9
 		end
 	
		pdf.span(200, :position => 195) do
			pdf.text "Vicente A. Scabuzzo", :size => 18
		end
	
		pdf.stroke_horizontal_rule		
	
		pdf.bounding_box([10, 775], :width => 200, :height => 70) do
			pdf.text "     FERRETERIA - PINTURERIA - BAZAR", :size => 11
			pdf.text "Av. 7 N° 220 e/36 y 37 - Tel (0221) 4212800. 1900 LA PLATA", :size => 7
			pdf.text "ferreteriascabuzzo@hotmail.com", :size => 8, :align => :center
			pdf.move_down(10)
			pdf.text "IVA RESPONSABLE INSCRIPTO", :align => :center, :size => 10
		end
			
		pdf.bounding_box([210, 775], :width => 150, :height => 70) do
			pdf.text "X", :size => 20, :align => :center
			pdf.move_down(5)
		    pdf.text "CUIT: 20-01109407-5", :size => 7, :align => :center
		    pdf.text "Ing. Brutos: 20-01109407-5", :size => 7, :align => :center
		    pdf.text "Legajo Municipal: 43.589", :size => 7, :align => :center
		    pdf.text "Inicio de Actividad: 01/10/1957", :size => 7, :align => :center
		end
		
		pdf.bounding_box([355, 775], :width => 180, :height => 70) do
			pdf.text "Documento no válido como factura", :size => 9, :align => :center
			pdf.text "PRESUPUESTO", :size => 9, :align => :center
			pdf.move_down(30)
			pdf.text "FECHA: #{@budget.format_date}", :size => 9, :align => :center
		end
	
	  end
	end
	
	
	pdf.span(505, :position => 30) do
		pdf.table @budget.data_to_prawn_table,
	   		:width => 500,
			:cell_style => { :size => 9 }
	
		pdf.table data_table,
	    	:width => 500,
			:cell_style => { :size => 9 }
	end
	
	
end