<!doctype html>
<html>
<head>
<title>asdf</title>
<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet"> 
<script
	src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g="
	crossorigin="anonymous"></script>

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
  height: 400px;
  background-color: #eeffec;
  width: 100%;
  font-size: 3em;
}
.block2 p{
  font-size: 0.4em;
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
<pre>{{r}}</pre>
<script>
  i = 0;
  $('#kasvi').click(function(){
    if (i > 10) {
      i = 0;
    }
    $('#kasvi').attr('src', 'kasvi/'+i+'.png');
  });
</script>
</body>
</html>
