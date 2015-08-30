<!DOCTYPE html>
<%@ page import="java.util.*" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <title>FoodSwap</title>
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
	
	table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
	}
	th, td {
	   padding: 5px;
	 text-align: left;
	}
    </style>
<script type="text/javascript">
		function confirmInput(){
			document.getElementById("result").innerHTML = "Processing Query..";
			return true;
		}
	</script>		
</head>
 <body data-spy="scroll" data-target=".navbar" data-offset="50">
    <div class="container">
      <div class="masthead"><div id="benefits"></div>
		<div class="row-fluid">
			<div class="span10">
				<img src="http://fridge.leftoverswap.com/img/swaplogonew90.png">
				<br><h1 style="color:red">FoodSwap</h1>
			</div>
		</div>
        <div class="navbar navbar-fixed-top">     
            <div class="container">
              <ul class="nav nav-tabs">
                <li><a href="http://foodswapweb.cfapps.io/index.jsp">Home</a></li>
                <li><a href="http://foodswapweb.cfapps.io/benefits.html">Benefits</a></li>
                 <li><a href="http://foodswapweb.cfapps.io/givers.html">FoodGivers</a></li>
		<li><a href="http://foodswapweb.cfapps.io/takers.html">FoodTakers</a></li>
                <li><a href="http://foodswapweb.cfapps.io/contact.html">Contact</a></li>
              </ul>
        </div><!-- /.navbar -->
      </div>
	</div>
      <!-- Example row of columns -->
<hr>
	<div id="main">
		<h1>Pick from here</h1>
		<form id="dbform"
			action="${pageContext.request.contextPath}/rest/db/pickFood"
			onsubmit="{return confirmInput()}">
		 <input type="submit" />
		</form>
	</div>
	<div>
	<span id="result"></span>
		<div>
		
			<%
				Map<String, Object> result2 = (Map<String, Object>)request.getAttribute("response");
				if(result2 != null && result2.get("result") != null){
		
						ArrayList<HashMap<String, Object>> rowList = (ArrayList<HashMap<String, Object>>)result2.get("result");
						ArrayList<String> colList = (ArrayList<String>)result2.get("columnList");
						boolean header = false;
						%> <div class="table-responsive"><table id="ql_rest" cellspacing="0"> <tr> 
						<%
							for(String col: colList){
								
								%> <th><%= col %></th> <%
							}
						%> </tr> <%
						for(HashMap<String, Object> row: rowList){
							%> <tr> <%
							for(String col: colList){
								
								%> <td><%= row.get(col) %></td> <%
							}
							%> </tr> <%
						}
						%> </table></div> <%
				}

			 %>

		</div>

	</div>
	
	<hr>
        <div class="footer">
  		  <div class="span8">
         	   	<p>&copy;  FoodSwap Verizon Hackathon 2015. </p>
  			</div>
  			
    	  </div>
  
 </div> <!-- /container -->
</body>
</html>
