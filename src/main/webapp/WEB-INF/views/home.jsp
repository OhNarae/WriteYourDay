<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Write Your Day</title>
<meta charset="utf-8">
<link rel="stylesheet" href="resources/css/reset.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="resources/css/style.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="resources/css/grid.css" type="text/css"
	media="screen">
<script src="./resources/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script>
	$(document).ready(function(){
		/* alert('${member.id}') */
		if(${member.id != ""})
			$('#top_menu').html('<a class="menu" href="mypage.do" target="article"><span><strong>M</strong>yPage</span></a>'+
					'&nbsp;&nbsp;&nbsp;<a class="menu" href="logout.do"><span><strong>L</strong>ogout</span></a>')
		else
			$('#top_menu').html('<a class="menu" href="index.html"><span><strong>L</strong>ogin</span></a>')
	})
</script>
</head>
<body id="page1">
	<!--==============================header==============================-->
	<header>
		<div class="row-2">
			<div class="main">
				<div class="container_12">
					<div class="grid_8">
						<h1>
							<a class="logo" href="index.do"><span>Write</span><strong>Y</strong>our<strong>D</strong>ay
							</a>
						</h1>
					</div>
					<div class="grid_4" align="right">
						<h1 id="top_menu">
							<!-- <a class="menu" href="index.html"><span><strong>L</strong>ogin</span></a> -->
							<!-- <a class="menu" href="index.html"><span><strong>M</strong>yPage</span></a> -->
							<!-- <a class="menu" href="index.html"><span><strong>L</strong>ogout</span></a> -->
						</h1>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!--==============================nav=================================-->
	<nav>
		<div class="row-1">
			<div class="main">
				<div class="container_12">
					<div class="grid_12">
						<nav>
							<ul class="menu">
								<!-- <li style="width:540px;"><a class="active" href="index.html" style="width:540px;"><h2>2018.01.05</h2></a></li> -->
								<li><a href="month.do" target="article">2018.01.05</a></li>
								<li><a href="memo.do" target="article">Memo</a></li>
								<li><a href="catalogue.html">Talk</a></li>
							</ul>
						</nav>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</nav>
	<!--==============================content=============================-->
	<section id="content">
	<div class="main">
	<iframe class="container_12" id="article" src="login.do" name="article" style="width: 960px;height: 1000px"></iframe>
	</div>
	</section>
</body>