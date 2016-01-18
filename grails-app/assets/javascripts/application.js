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

var TICKIT = (function($) {

	return {
		init: init,
		selectMenu: selectMenu
	};

	function init(){
		$('[data-toggle="tooltip"]').tooltip();
		$('.tickit-btn-scrolltop').on('click', scrollTop);
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

})(jQuery);

$(document).ready(function(){
	TICKIT.init();
});