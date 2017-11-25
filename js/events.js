
$(function() {
  var ls = $('#lightSlider').lightSlider({
    gallery: true,
    item: 1,
    loop: true,
    slideMargin: 0,
    thumbItem: 9
  });
  ls.goToSlide(7);

  window.plantStage = 0;

  $('.lightSlider img').click(function(){
    /*
    i++;
    if (i > 9) {
      i = 0;
    }
    $('#kasvi').attr('src', 'kasvi/'+i+'.png');
    */
    //$('#extra-wrapper').slideToggle();

    $("#extra-wrapper").slideDown(500, window.refresh_plot);
    $('html, body').animate({
      scrollTop: $("#extra-wrapper").offset().top
    }, 500);

  });

  window.dateIndex = 8;

/*
  $('#debug_prev').click(function(){
    window.prevDay();
  });

  $('#debug_next').click(function(){
    window.nextDay();
  });
*/

  window.nextDay = function() {
    window.dateIndex++;
    if (window.maxIndex < window.dateIndex) {
      window.dateIndex = window.maxIndex;
    } else {
      window.refresh_plot();

      growPlant();
    }
  }

  window.prevDay = function() {
    window.dateIndex--;
    if (window.dateIndex < 8) {
      window.dateIndex = 8;
    } else {
      window.refresh_plot();

      ungrowPlant();
    }
  }

  window.growPlant = function() {
    window.plantStage++;
    if (window.plantStage > 11) {
      window.plantStage = 11;
    }

    $('.monthProgress').text((window.plantStage * 2 + 3)+"");
    $('.thismonthplant').attr('src', 'kasvi/'+window.plantStage+'.png');
  }

  window.ungrowPlant = function() {
    window.plantStage--;
    if (window.plantStage < 0) {
      window.plantStage = 0;
    }

    $('.monthProgress').text((window.plantStage * 2 + 3)+"");
    $('.thismonthplant').attr('src', 'kasvi/'+window.plantStage+'.png');

    console.log('kasvi/'+window.plantStage+'.png');
  }

  window.onBetter = function() {
    console.log("Better!");
  }

  window.onWorse = function() {
    console.log("Worse!");
  }

  $(document).keydown(function(e) {
    switch(e.which) {
        case 39: // left
          window.nextDay();
        break;

        case 37: // right
          window.prevDay();
        break;

        default: return; // exit this handler for other keys
    }
    e.preventDefault(); // prevent the default action (scroll / move caret)
  });

  ungrowPlant();

});
