<!DOCTYPE html>
<%@ page import="java.util.*" %>
<html>
<head>
<title>FoodSwap</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/db.css">
<script type="text/javascript">
		function confirmInput(){
			document.getElementById("result").innerHTML = "Processing Query..";
			return true;
		}
	</script>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  
  
   
    
<link rel="shortcut icon"
 href="favicon.ico" />
    <!-- Le styles -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 60px;
      }

      /* Custom container */
      .container {
        margin: 0 auto;
        max-width: 1000px;
      }
      .container > hr {
        margin: 60px 0;
      }



      /* Customize the navbar links to be fill the entire space of the .navbar */
      .navbar .navbar-inner {
        padding: 0;
      }
      .navbar .nav {
        margin: 0;
        display: table;
        width: 100%;
      }
      .navbar .nav li {
        display: table-cell;
        width: 1%;
        float: none;
      }
      .navbar .nav li a {
        font-weight: bold;
        text-align: center;
        border-left: 1px solid rgba(255,255,255,.75);
        border-right: 1px solid rgba(0,0,0,.1);
      }
      .navbar .nav li:first-child a {
        border-left: 0;
        border-radius: 3px 0 0 3px;
      }
      .navbar .nav li:last-child a {
        border-right: 0;
        border-radius: 0 3px 3px 0;
      }

	.sticky {
	  position: fixed;
	  top: 0;
	}
	
    </style>
</head>
<body>

<div class="container">

      <div class="masthead"><div id="benefits"></div>
		<div class="row-fluid">

		
		
		
			<div class="span10">
				<img src="http://fridge.leftoverswap.com/img/swaplogonew90.png" width=75  height=75>
			<div class="span11">
				
			<h1>FoodSwap<h1>
			</div>
			</div>
		</div>
       <div class="navbar navbar-fixed-top">     
            <div class="container">

              <ul class="nav nav-tabs">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="benefits.html">Benefits</a></li>
                <li><a href="givers.html">FoodGivers</a></li>
				<li><a href="takers.html">FoodTakers</a></li>
                <li><a href="contact.html">Contact</a></li>
              </ul>

        </div><!-- /.navbar -->
      </div>
	</div>
<hr>
        <div class="footer">
  		  <div class="span8">
         <p>&copy;  FoodSwap Verizon Hackathon 2015. </p>
  			</div>
    	  </div>
    </div> <!-- /container -->

	<div id="main">
		<h1>Post it Here</h1>
		<form id="dbform"
			action="${pageContext.request.contextPath}/rest/db/postFood"
			onsubmit="{return confirmInput()}">
			<textarea rows="1" cols="100" name="foodType"
				placeholder="What is it?">${foodType}</textarea>
				<textarea rows="1" cols="100" name="additionalInfo"
				placeholder="Where to Pick?">${additionalInfo}</textarea>
			<br /> <input type="submit" />
		</form>
	</div>
	<div>
		Result: <span id="result">${response.message}</span>
	</div>
	
	
	
	
</body>
</html>
