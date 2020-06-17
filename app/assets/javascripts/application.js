// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require bootstrap-sprockets
//= require popper
//= require_tree .

// $(function() {
// 	setTimeout(function(){
// 		$('.start p').fadeIn(1600);
// 	},500); //0.5秒後にロゴをフェードイン!
// 	setTimeout(function(){
// 		$('.start').fadeOut();
// 	},3000); //2.5秒後にロゴ含め真っ白背景をフェードアウト！
// });

$(document).on('turbolinks:load', function() {
  $(function(){
    var pace = $('.pace-wrap');

    //ページの読み込みが完了したらアニメーションを非表示
    $(window).on('load',function(){
      pace.fadeOut();
    });

    //ページの読み込みが完了してなくても2秒後にアニメーションを非表示にする
    setTimeout(function(){
      pace.fadeOut();
    },2000);
  });
});

