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
  width: 100%;
  font-size: 3em;
}
.block2{
  padding: 30px;
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

.demo {
    max-width:420px;
    width: 100%;
    overflow: hidden;
    margin: 20px auto;
}
ul {
    list-style: none outside none;
    padding-left: 0;
    margin-bottom:0;
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
</style>
</head>
<body>
<div class="block1">
	Grow your tree together with Fortum!
</div>
<div class="block2">
	This months progress
	<div class="demo">
	    <ul id="lightSlider">
		<li data-thumb="kasvi/0.png">
		    <img src="kasvi/0.png" id="kasvi"/>
		</li>
		<li data-thumb="http://sachinchoolur.github.io/lightslider/img/thumb/cS-2.jpg">
		    <img src="http://sachinchoolur.github.io/lightslider/img/cS-2.jpg" />
		</li>
		<li data-thumb="http://sachinchoolur.github.io/lightslider/img/thumb/cS-3.jpg">
		    <img src="http://sachinchoolur.github.io/lightslider/img/cS-3.jpg" />
		</li>
		<li data-thumb="http://sachinchoolur.github.io/lightslider/img/thumb/cS-4.jpg">
		    <img src="http://sachinchoolur.github.io/lightslider/img/cS-4.jpg" />
		</li>
		<li data-thumb="http://sachinchoolur.github.io/lightslider/img/thumb/cS-5.jpg">
		    <img src="http://sachinchoolur.github.io/lightslider/img/cS-5.jpg" />
		</li>
		<li data-thumb="http://sachinchoolur.github.io/lightslider/img/thumb/cS-6.jpg">
		    <img src="http://sachinchoolur.github.io/lightslider/img/cS-6.jpg" />
		</li>
		<li data-thumb="http://sachinchoolur.github.io/lightslider/img/thumb/cS-7.jpg">
		    <img src="http://sachinchoolur.github.io/lightslider/img/cS-7.jpg" />
		</li>
		<li data-thumb="http://sachinchoolur.github.io/lightslider/img/thumb/cS-8.jpg">
		    <img src="http://sachinchoolur.github.io/lightslider/img/cS-8.jpg" />
		</li>
		<li data-thumb="http://sachinchoolur.github.io/lightslider/img/thumb/cS-9.jpg">
		    <img src="http://sachinchoolur.github.io/lightslider/img/cS-9.jpg" />
		</li>
		<li data-thumb="http://sachinchoolur.github.io/lightslider/img/thumb/cS-10.jpg">
		    <img src="http://sachinchoolur.github.io/lightslider/img/cS-10.jpg" />
		</li>
		<li data-thumb="http://sachinchoolur.github.io/lightslider/img/thumb/cS-11.jpg">
		    <img src="http://sachinchoolur.github.io/lightslider/img/cS-12.jpg" />
		</li>
		<li data-thumb="http://sachinchoolur.github.io/lightslider/img/thumb/cS-13.jpg">
		    <img src="http://sachinchoolur.github.io/lightslider/img/cS-13.jpg" />
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

  <div id="debug-buttons">
    <button type="button", id="debug_prev"> back </button>
    <button type="button", id="debug_next"> fwd </button>
  </div>

</div>

<script src="js/events.js"></script>
<script src="js/plot.js"></script>

</body>
</html>
