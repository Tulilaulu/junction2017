
$(function() {
	$('#lightSlider').lightSlider({
	    gallery: true,
	    item: 1,
	    loop: true,
	    slideMargin: 0,
	    thumbItem: 9
	});
  var i = 0;
  $('#kasvi').click(function(){
    /*
    i++;
    if (i > 9) {
      i = 0;
    }
    $('#kasvi').attr('src', 'kasvi/'+i+'.png');
    */
    //$('#extra-wrapper').slideToggle();

    $("#extra-wrapper").slideToggle(500);
    $('html, body').animate({
      scrollTop: $("#extra-wrapper").offset().top
    }, 500);

  });

  window.dateIndex = 8;

  $('#debug_prev').click(function(){
    window.dateIndex--;
    if (window.dateIndex < 8) {
      window.dateIndex = 8;
    } else {
      window.refresh_plot();
    }
  });

  $('#debug_next').click(function(){
    window.dateIndex++;
    if (window.maxIndex < window.dateIndex) {
      window.dateIndex = window.maxIndex;
    } else {
      window.refresh_plot();
    }
  });

  window.onBetter = function() {
    console.log("Better!");
  }

  window.onWorse = function() {
    console.log("Worse!");
  }

});
