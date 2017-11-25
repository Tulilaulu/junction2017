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
		<li data-thumb="kasvi/7.png">
                    <p>June (17/25)</p>
		    <img src="kasvi/7.png"/>
		</li>
		<li data-thumb="kasvi/4.png">
                    <p>July (11/25)</p>
		    <img src="kasvi/4.png"/>
		</li>
		<li data-thumb="kasvi/full2.png">
                    <p>August (25/25)</p>
		    <img src="kasvi/full2.png"/>
		</li>
		<li data-thumb="kasvi/1.png">
                    <p>September (5/25)</p>
		    <img src="kasvi/1.png"/>
		</li>
		<li data-thumb="kasvi/full1.png">
                    <p>October (25/25)</p>
		    <img src="kasvi/full1.png"/>
		</li>
		<li data-thumb="kasvi/0.png" id="thismonth">
		    <img class="weatherStatus" src="kasvi/cloud.png"/>
		    <p>This month's progress (<span class="monthProgress">22</span>/25):</p>
		    <img class="thismonthplant" src="kasvi/0.png"/>
		</li>
	    </ul>
	</div>

	<p>Use energy more efficiently than your community and grow your tree.</p>

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
