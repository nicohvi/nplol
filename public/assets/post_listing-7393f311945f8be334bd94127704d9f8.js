(function(){$(function(){var t;return t=$("#posts"),t.packery({itemSelector:".post",gutter:20,isHorizontal:!0}),$(".post").on("click",function(){var o;return o=$(this).data("post-id"),$.ajax("/posts/"+o).done(function(n){return updateMainCanvas(n),history.pushState({},"",""),history.pushState({},"","/posts/"+o),window.history.go(2),t.packery()}).fail(function(){return console.log("Loading post failed.")})})})}).call(this);