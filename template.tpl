<!doctype html>
<html>
<head>
<title>asdf</title>
<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/social-likes/dist/social-likes_flat.css">
<script
	src="https://code.jquery.com/jquery-3.2.1.min.js">
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/social-likes/dist/social-likes.min.js"></script>
<style>
body, html{
  margin: 0px;
  padding: 0px;
  font-family: 'Oswald', sans-serif;
}
.block1{
  padding: 20px;
  text-align: center;
  background-color: #9fd79a;
  color: white;
  width: 100%;
  font-size: 3em;
}
.block2{
  padding-top: 40px;
  text-align: center;
  color: #9fd79a;
  min-height: 400px;
  background-color: #eeffec;
  width: 100%;
  font-size: 3em;
  padding-bottom: 10px;
}
.block2 p{
  font-size: 0.4em;
}
#chart-wrapper {
  margin-left: 25%;
  width: 50%;
}
#debug-buttons {
  margin-left: 25%;
  width: 50%;
}
img{
  cursor: pointer;
}
</style>
</head>
<body>
<div class="block1">
	Grow your tree!
</div>
<div class="block2">
	This months progress
	<br/>
	<img src="kasvi/0.png" id="kasvi"/>
	<p>Your plant grows every day of the month when you don't use more electricity than your average.</p>
</div>

<div id="chart-wrapper">
<div id="chart_div"></div>
</div>

<div id="debug-buttons">
  <button type="button", id="debug_prev"> back </button>
  <button type="button", id="debug_next"> fwd </button>
</div>

<!--<pre>{{r}}</pre>-->
<div class="social-likes">
	<div class="facebook" title="Share link on Facebook">Facebook</div>
	<div class="twitter" title="Share link on Twitter">Twitter</div>
	<div class="plusone" title="Share link on Google+">Google+</div>
</div>
<script>
$(function() {
  var i = 0;
  $('#kasvi').click(function(){
    i++;
    if (i > 9) {
      i = 0;
    }
    $('#kasvi').attr('src', 'kasvi/'+i+'.png');
  });
});
</script>

<script>
$(function() {
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
});
</script>

<script src="js/plot.js"></script>

</body>
</html>
