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
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="block1">
	Grow your tree together with Fortum!
</div>
<div class="block2">
	<div class="demo">
	    <ul id="lightSlider">
		<li data-thumb="kasvi/6.png">
                    <p>May (25/25)</p>
		    <img src="kasvi/6.png"/>
		</li>
		<li data-thumb="kasvi/5.png">
                    <p>June (25/25)</p>
		    <img src="kasvi/5.png"/>
		</li>
		<li data-thumb="kasvi/4.png">
                    <p>July (22/25)</p>
		    <img src="kasvi/4.png"/>
		</li>
		<li data-thumb="kasvi/3.png">
                    <p>August (22/25)</p>
		    <img src="kasvi/3.png"/>
		</li>
		<li data-thumb="kasvi/2.png">
                    <p>September (15/25)</p>
		    <img src="kasvi/2.png"/>
		</li>
		<li data-thumb="kasvi/1.png">
                    <p>October (2/25)</p>
		    <img src="kasvi/1.png"/>
		</li>
		<li data-thumb="kasvi/0.png" id="thismonth">
		    <img id="status" src="kasvi/cloud.png"/>
		    <p>This months progress (22/25):</p>
		    <img id="thismonthplant" src="kasvi/0.png"/>
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
