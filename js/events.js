
$(function() {
  var ls = $('#lightSlider').lightSlider({
    gallery: true,
    item: 1,
    loop: true,
    slideMargin: 0,
    thumbItem: 9
  });
  ls.goToSlide(6);

  $('.fa-user').click(function(){
    $(".address").slideToggle();
  });
  window.plantStage = 0;

  $('.lightSlider #thismonth').click(function(){
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

  var makeWeather = function() {
    if (Math.random() > 0.5) {
      window.isSunny = true;
      $(".weatherStatus").attr('src', "kasvi/sun.png");
    } else {
      window.isSunny = false;
      $(".weatherStatus").attr('src', "kasvi/cloud.png");
    }
  }

  window.nextDay = function() {
    window.dateIndex++;
    if (window.maxIndex < window.dateIndex) {
      window.dateIndex = window.maxIndex;
    } else {
      window.refresh_plot();

      if (window.isSunny === true)
        growPlant();

      makeWeather();
    }
  }

  window.prevDay = function() {
    window.dateIndex--;
    if (window.dateIndex < 8) {
      window.dateIndex = 8;
    } else {
      window.refresh_plot();

      ungrowPlant();

      makeWeather();
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
