<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
	href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.96.1/css/materialize.min.css">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.96.1/js/materialize.min.js"></script>
	
<style type="text/css">
img.mainimg {
	width: 250px;
	height: 200px;
	border: 1px solid #aaa;
	margin: 10px 10px 10px 10px;
}

img.mainimg:hover {
	cursor: pointer;
	width: 400px;
	height: 300px;
	border: 5px solid black;
}

table.maintb {
	width: 700px;
}

table.maintb tr {
	height: 180px;
}

.slider .indicators .indicator-item {
	background-color: #666666;
	border: 3px solid #ffffff;
	-webkit-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	-moz-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}

.slider .indicators .indicator-item.active {
	background-color: #ffffff;
}

.slider {
	width: 100%;
	margin: 0 auto;
}

.slider .indicators {
	bottom: 60px;
	z-index: 100;
	/* text-align: left; */
}
</style>

<script type="text/javascript">

$(document).ready(function(){
	  $('.slider').slider();
	});
</script>
<title>Apple Project</title>
</head>
<%
String root=request.getContextPath();
%>
<body>
<%-- 	 <table class="maintb">
<%
int n=0;

for(int row=1;row<=2;row++)
{%>
	<tr>
	  <%
	  for(int col=1;col<=3;col++)
	  {
		  n++;
	  
	  %>
		  <td>
		    <img alt="" src="<%=root%>/AppleProduct_img/main<%=n%>.PNG" class="mainimg">
		  </td>
	  <%}
	  %>
	</tr>
<%}
%> 

</table>   --%>


	<div class="slider">
		<ul class="slides">
			<li><img src="image/mainimg/mainimg1.PNG"> <!-- random image -->
				<div class="caption center-align">
					<h3>This is our big Tagline!</h3>
					<h5 class="light grey-text text-lighten-3"></h5>
				</div></li>
			<li><img src="image/mainimg/mainimg2.PNG"> <!-- random image -->
				<div class="caption left-align">
					<h3></h3>
					<h5 class="light grey-text text-lighten-3"></h5>
				</div></li>
			<li><img src="image/mainimg/mainimg3.PNG"> <!-- random image -->
				<div class="caption right-align">
					<h3></h3>
					<h5 class="light grey-text text-lighten-3"></h5>
				</div></li>
		</ul>
	</div>

</body>
</html>