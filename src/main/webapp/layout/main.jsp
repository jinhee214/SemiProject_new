<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style: none;
}

#slideWrap {
	width: 1300px;
	height: 700px;
	overflow: hidden;
	position: relative;
}

#slider {
	height: 100%;
	position: absolute;
}

#slider ul {
	display: inline;
}

#slider li {
	float: left;
	width: 1300px;
	height: 100%;
}

#slider li a img{
	width:1300px;
	height: 700px;
}

.main-comment-img1{
	position: absolute;
	top:600px;
	left:570px;
	font-size:14pt;
	font-weight: 700;
	
}

.main-comment-img2{
position: absolute;
	top:200px;
	left:1800px;
	font-size:14pt;
	font-weight: 700;
	
	
}
.main-comment-img23{
position: absolute;
	top:200px;
	left:2000px;
	font-size:14pt;
	font-weight: 700;
	
}

.main-comment-img3{
	position: absolute;
	top:600px;
	left:3170px;
	font-size:14pt;
	font-weight: 700;
	
}
</style>


</head>
<body>
	<div id="slideWrap">
		<ul id="slider">
			<li><a href="#"><img src="image/mainimg/mainimg1.PNG" alt="iphone"></a>
			<a class="main-comment-img1" href="index.jsp?main=product/iPhone13_ProDe.jsp">더 알아보기 <span class="glyphicon glyphicon-chevron-right"></span></a>
			</li>
			<li><a href="#"><img src="image/mainimg/mainimg2.PNG" alt="mac"></a>
			<a class="main-comment-img2" href="index.jsp?main=product/maclist.jsp">더 알아보기 <span class="glyphicon glyphicon-chevron-right"></span></a>
			<a class="main-comment-img23" href="index.jsp?main=product/Macbook_ProM1.jsp">구매하기 <span class="glyphicon glyphicon-chevron-right"></span></a>
			</li>
			<li><a href="#"><img src="image/mainimg/mainimg3.PNG" alt="airpods"></a>
			<a class="main-comment-img3" href="index.jsp?main=product/AirPods_ProDe.jsp">더 알아보기 <span class="glyphicon glyphicon-chevron-right"></span></a>
			</li>
		</ul>
	</div>
	<script>
		var ul = document.querySelector('#slider')
		var slideNumber = document.querySelector('#slider').childElementCount
		var li = document.querySelector('#slider>li')
		var firstItemClone = ul.firstElementChild.cloneNode(true);
		ul.appendChild(firstItemClone);
		ul.style.width = (slideNumber + 1) * 1300 + 'px'
		function move() {
			var i = 0;
			setInterval(function() {
				ul.style.transition = '0.2s';
				ul.style.transform = 'translate3d(-' + 1300 * (i + 1)
						+ 'px, 0px, 0px)';
				i++;
				if (i == slideNumber) {
					setTimeout(function() {
						ul.style.transition = '0s';
						ul.style.transform = "translate3d(0px, 0px, 0px)";
					}, 201)
					i = 0;
				}
			}, 3000);
		}
		document.addEventListener("DOMContentLoaded", function() {
			move();
		});
	</script>


</body>
</html>