<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./libs.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Write Your Day</title>
<meta charset="utf-8">
<script>
	$(document).ready(function(){
		if(${not empty loginInfo.id}) topMenu();
	})	
	
	function topMenu(){
		$('#top_menu').html('<a class="menu" href="mypage.do" target="article"><span><strong>M</strong>yPage</span></a>'+
		'&nbsp;&nbsp;&nbsp;<a class="menu" href="logout.do"><span><strong>L</strong>ogout</span></a>') 
		
		$('#menuMonth').attr('href', 'month.do');
		$('#menuMemo').attr('href', 'memo.do');
		$('#menuTalk').attr('href', 'talk.do');
	}
	
	
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
							<a class="logo" href="/WriteYourDay/month.do"><span>Write</span><strong>Y</strong>our<strong>D</strong>ay
							</a>
						</h1>
					</div>
					<div class="grid_4" align="right">
						<h1 id="top_menu"></h1>
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
								<li><a href="login.do" target="article" id="menuMonth">Month</a></li>
								<li><a href="login.do" target="article" id="menuMemo">Memo</a></li>
								<li><a href="login.do" target="article" id="menuTalk">Talk</a></li>
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
			<iframe id="article" src="login.do" name="article"
				style="width: 960px; height: 1000px"></iframe>
		</div>
	</section>
</body>