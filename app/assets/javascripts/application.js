// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require jquery.ui.all
//= require maskedinput
//= require rails.validations
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".row-fluid").hide();
}

function add_fields(link, association, content) {
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g");
	$("#items").append(content.replace(regexp, new_id));
}

$(function() {
  $(".date").mask("99/99/9999");
  $(".time").mask("99/99/9999 99:99");

});
// app/assets/javascripts/articles.js
// Parse the JSON response and replace the <form> with the successfully created article
$('form.new_article').on('ajax:success', function(event, data, status, xhr) {
	$(this).replaceWith('<div>Title: ' + data.title + '</div>' + '<div>Body: ' + data.body + '</div>');
});

// Parse the JSON response and generate an unordered list of errors, then stick it inside
// <div class="errors"> which is in our view template
$('form.new_article').on('ajax:error', function(event, xhr, status, error) {

	var responseObject = $.parseJSON(xhr.responseText), errors = $('<ul />');

	$.each(responseObject, function(index, value) {
		errors.append('<li>' + index + ':' + value + '</li>');
	})

	$(this).find('.errors').html(errors);
});

function get_markup(id_line) {
	var markup = parseInt($("#" + id_line + "markup").val(), 10);
	if(isNaN(markup)) {
		markup = $("#budget_general_markup").val();
	} 
	return markup;
}

function calculate_amount(id) {
	input_price = $("#" + id);
	var id_line = input_price.attr('id_line');
	var price = parseFloat($("#" + id_line + "price").val(), 10) ;
	var quantity = parseInt($("#" + id_line + "quantity").val(), 10);
	var markup = get_markup(id_line);
	var coeff = (markup / 100) + 1;
	var price_with_markup = (price * coeff).toFixed(2);
	var total_price = (price_with_markup * quantity);
	$("#" + id_line + "import").attr('value', total_price);
}

function recalculate_amounts() {
	$( ".input-price" ).each(function() {
		calculate_amount($(this).attr('id'));
	});
}

jQuery.extend( jQuery.fn.dataTableExt.oSort, {
"date-uk-pre": function ( a ) {
    var ukDatea = a.split('/');
    return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
},

"date-uk-asc": function ( a, b ) {
    return ((a < b) ? -1 : ((a > b) ? 1 : 0));
},

"date-uk-desc": function ( a, b ) {
    return ((a < b) ? 1 : ((a > b) ? -1 : 0));
}
} );

$(document).ready(function() {
    $('.datatable').dataTable({
    	"iDisplayLength": 50,
    	"oLanguage": {
			"sProcessing": "Procesando...",
			"sLengthMenu": "Mostrar _MENU_ registros",
			"sZeroRecords": "No se encontraron resultados",
			"sInfo": "Mostrando desde _START_ hasta _END_ de _TOTAL_ registros",
			"sInfoEmpty": "Mostrando desde 0 hasta 0 de 0 registros",
			"sInfoFiltered": "(filtrado de _MAX_ registros en total)",
			"sInfoPostFix": "",
			"sSearch": "Buscar:",
			"sUrl": "",
			"oPaginate": {
				"sFirst": "Primero",
				"sPrevious": "Anterior",
				"sNext": "Siguiente",
				"sLast": "Último"
			}
		},
		"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
  		"sPaginationType": "bootstrap",
  		"aoColumns": [
            null,
            null,
            null,
            { "sType": "date-uk" },  
            { "bSortable": false }
        ]
  	});
  	
  	
} );

