<!doctype html>
<html>
<head>
<title>Grow your tree with Fortum</title>
<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/social-likes/dist/social-likes_flat.css">
<script
	src="https://code.jquery.com/jquery-3.2.1.min.js">
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/social-likes/dist/social-likes.min.js"></script>
<link type="text/css" rel="stylesheet" href="css/lightslider.css" />
<script src="js/lightslider.js"></script>
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
  font-size: 36px;
}
.block2{
  text-align: center;
  color: #9fd79a;
  min-height: 400px;
  background-color: #eeffec;
  width: 100%;
  padding-top: 10px;
  padding-bottom: 30px;
}
.block2 p{
  font-size: 20px;
  padding: 0px 20px;
}
li p{
  font-size: 30px;
}
#chart-wrapper {
  margin-left: 25%;
  width: 50%;
}
#debug-buttons {
  margin-left: 25%;
  width: 50%;
}
@media screen and (max-width: 700px){
#chart-wrapper {
  margin-left: 0;
  width: 100%;
}
}
.demo {
    max-width:420px;
    width: 100%;
    overflow: hidden;
    margin: 20px auto;
}
ul {
    list-style: none outside none;
    padding-left: 0;
    margin: 0 auto;
}
li {
    display: block;
    float: left;
    margin-right: 6px;
    cursor:pointer;
}

#kasvi {
  height: 200px;
}
#extra-wrapper {
  display: none;
}
img{
  cursor: pointer;
    display: block;
    height: auto;
    max-width: 100%;
    margin: 0 auto;
}
.social-likes{
  padding-top: 20px;
}
.social-likes div{
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  border-radius: 2px;
}
</style>
</head>
<body>
<div class="block1">
	Grow your tree together with Fortum!
</div>
<div class="block2">
	<div class="demo">
	    <ul id="lightSlider">
		<li data-thumb="kasvi/0.png" id="thismonth">
		    <p>This months progress (22/25):</p>
		    <img src="kasvi/0.png"/>
		</li>
		<li data-thumb="kasvi/1.png">
                    <p>Lokakuu (2/25)</p>
		    <img src="kasvi/1.png"/>
		</li>
		<li data-thumb="kasvi/2.png">
                    <p>Syyskuu (15/25)</p>
		    <img src="kasvi/2.png"/>
		</li>
		<li data-thumb="kasvi/3.png">
                    <p>Elokuu (22/25)</p>
		    <img src="kasvi/3.png"/>
		</li>
		<li data-thumb="kasvi/4.png">
                    <p>Heinäkuu (22/25)</p>
		    <img src="kasvi/4.png"/>
		</li>
		<li data-thumb="kasvi/5.png">
                    <p>Kesäkuu (25/25)</p>
		    <img src="kasvi/5.png"/>
		</li>
		<li data-thumb="kasvi/6.png">
                    <p>Toukokuu (25/25)</p>
		    <img src="kasvi/6.png"/>
		</li>
	    </ul>
	</div>

	<p>Your plant grows every day of the month when you don't use more electricity than your average.</p>

	<center>
            <div class="social-likes">
                <div class="facebook" title="Share link on Facebook">Facebook</div>
                <div class="twitter" title="Share link on Twitter">Twitter</div>
                <div class="plusone" title="Share link on Google+">Google+</div>
            </div>
        </center>
</div>

<!--<pre>{{r}}</pre>-->

<div id="extra-wrapper">

  <div id="chart-wrapper">
  <div id="chart_div"></div>
  </div>

  <div id="debug-buttons", style="display: none">
    <button type="button", id="debug_prev"> back </button>
    <button type="button", id="debug_next"> fwd </button>
  </div>

</div>

<script src="js/events.js"></script>
<script src="js/plot.js"></script>

</body>
</html>
