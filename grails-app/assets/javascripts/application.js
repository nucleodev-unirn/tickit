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
//= require_self

var TICKIT = (function($) {

	return {
		init: init,
		selectMenu: selectMenu
	}

	function init(){
		$('[data-toggle="tooltip"]').tooltip();
	}

	function selectMenu(id){
		var $opt = $("#"+id);
		$(".sidebar-menu li.active").removeClass("active").find("ul").removeClass("menu-open").css('display','none');

		$opt.parent().addClass('menu-open');
		$opt.parent().parent().addClass('active');
		$opt.addClass('active');
	}

})(jQuery);

$(document).ready(function(){
	TICKIT.init();
});