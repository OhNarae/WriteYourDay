<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./libs.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Write Your Day</title>
<meta charset="utf-8">
<style type="text/css">

 h2 {
	font-family: Rubik, sans-serif;
	display: block;
	font-size: 2em;
	font-weight: bold;
	margin-left: 10px;
} 

p {
	display: block;
	font-weight: 300;
	color: #817586;
	margin-left: 10px;
	margin-top: 10px;
}
</style>
</head>
<body id="page1">
	<!--==============================header==============================-->
	<header>
		<div class="row-2">
			<div class="main">
				<div class="container_12">
					<div class="grid_8">
						<h1>
							<a class="logo" href="/WriteYourDay/"><span>Write</span><strong>Y</strong>our<strong>D</strong>ay
							</a>
						</h1>
					</div>
					<div class="grid_4" align="right">
						<h1 id="top_menu">
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
								<li><a href="javascript:void(0)" target="article">Error</a></li>
								<li><a href="javascript:void(0)" target="article">Error</a></li>
								<li><a href="javascript:void(0)" target="article">Error</a></li>
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
		<div class="container_12">
			<div class="wrapper">
				<div class="grid_12">
					<div class="indent-top3">
						<div class="lmain">
							<div class="indent-left">
								<div>
									<h2>ERROR</h2>
									<p>${error_msg}</p>
								</div>
								<img src="./resources/images/error.png" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>