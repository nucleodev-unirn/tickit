// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require bootstrap
//= require app.min.js
//= require carrossel/ie10-viewport-bug-workaround
//= require carrossel/ie-emulation-modes-warning
//= require carrossel/holder.min.js
//= require_self
// require datapicker/bootstrap-datepicker
// require jquery.ui.datepicker-pt-BR

var TICKIT = (function($) {

	return {
		init: init,
		selectMenu: selectMenu
	};

	function init(){
		$('[data-toggle="tooltip"]').tooltip();
		$('.tickit-btn-scrolltop').on('click', scrollTop);
		$('button.tickit-btn-scroll-to-anchor').on('click', function(){
			var destino = $(this).data("destino");
			console.log(destino);
			$("html,body").animate({scrollTop: $(destino).offset().top},'slow')
		});
	}

	function selectMenu(id){
		var $opt = $("#"+id);
		$(".sidebar-menu li.active").removeClass("active").find("ul").removeClass("menu-open").css('display','none');

		$opt.parent().addClass('menu-open');
		$opt.parent().parent().addClass('active');
		$opt.addClass('active');
	}

	function scrollTop(){
		$('html,body').animate({scrollTop:0}, 'slow');
	}

	var componentes ={
		carregarCalendario: function () {
			$.datepicker.regional[ "pt-BR" ];
			$("input[name$='_datePicker']").focusin(function(){
				$("#ui-datepicker-div").css('z-index','9999');
			});

			$("input[name$='_datePicker']").datepicker({
				dateFormat: 'dd/mm/yy',
				onSelect: function (dateText, inst) {
					var name = inst.id.split("_")[0];
					$("#" + name + "_day").val(inst.selectedDay);
					$("#" + name + "_month").val(inst.selectedMonth + 1);
					$("#" + name + "_year").val(inst.selectedYear);
				}
			});
		}
	};

})(jQuery);

$(document).ready(function(){
	TICKIT.init();
	componentes.carregarCalendario();
});