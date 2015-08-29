<!DOCTYPE html>
<%@ page import="java.util.*" %>
<html>
<head>
<title>DBTool</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/db.css">
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
		<h1>Execute DB Queries here</h1>
		<form id="dbform"
			action="${pageContext.request.contextPath}/rest/db/submitQuery"
			onsubmit="{return confirmInput()}">
			<textarea rows="1" cols="100" name="query"
				placeholder="Entery Your Query Here">${query}</textarea>
			<br /> <input type="submit" />
		</form>
	</div>
	<div>
		Result: <span id="result">${response.message}</span>
		<div>
		
			<%
				Map<String, Object> result2 = (Map<String, Object>)request.getAttribute("response");
				if(result2 != null && result2.get("result") != null){
		
						ArrayList<HashMap<String, Object>> rowList = (ArrayList<HashMap<String, Object>>)result2.get("result");
						ArrayList<String> colList = (ArrayList<String>)result2.get("columnList");
						boolean header = false;
						%> <table id="ql_rest" cellspacing="0"> <tr> 
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
						%> </table> <%
				}
			 %>

		</div>

	</div>
</body>
</html>
