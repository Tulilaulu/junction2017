<!doctype html>
<html>
<head>
<title>asdf</title>
<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
<script
	src="https://code.jquery.com/jquery-3.2.1.min.js">
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
body, html{
  margin: 0px;
  padding: 0px;
  font-family: 'Oswald', sans-serif;
}
.block1{
  padding-top: 80px;
  text-align: center;
  background-color: #9fd79a;
  color: white;
  height: 360px;
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
img{
  cursor: pointer;
}
</style>
</head>
<body>
<div class="block1">
	Your consuption compared to yesterday
	<h2>-5%</h2>
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

<pre>{{r}}</pre>

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

<script src="js/plot.js"></script>

</body>
</html>
