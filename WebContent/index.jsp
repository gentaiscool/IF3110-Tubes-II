<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="helloJsp.object.ShoppingCart"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="public/css/style.css">
<title>Insert title here</title>
</head>
<body class="container">
	<%@ page import="java.util.ArrayList"%>
	<%@ page import="helloJsp.model.ModelInventori"%>
	<%
		ArrayList<ModelInventori> TabelBarang = new ArrayList<ModelInventori>();
	%>
	<%@include file="templates/header.jsp"%>

		<!--  <div class="content">
			<button onClick=""><<</button>
			<div id="contents">
				<img src="public/img/logo.png" width="300">
			</div>
			<div id="contents">
				<img src="public/img/logo.png" width="300">
			</div>
			<div id="contents">
				<img src="public/img/logo.png" width="300">
			</div>
			<div id="contents"><button>>></button></div>
		</div>-->
	
	</div>
	
	<div class="leftbar">
		<h2>MOST FAVOURITE MENU</h2>
	<%
	
	if (session.getAttribute("favorit") != null){
		TabelBarang = (ArrayList<ModelInventori>) session.getAttribute("favorit");
		out.println("<h2>APPETIZER</h2>");
		int j = 0;
		for (int i=0; i<TabelBarang.size(); i++){
			if (TabelBarang.get(i).getId_kategori() == 1){
				out.println("<div class=\"barang\">");
				out.println("<img width=100px height=100px src=public/img/appetizer/" + TabelBarang.get(i).getGambar() + " alt=" + TabelBarang.get(i).getNama_inventori() + " width = 150 height=300>");
				out.println("<br/><a href='detailBarang.jsp?idBarang="+(TabelBarang.get(i).getId_inventori()-1)+"'>"+TabelBarang.get(i).getNama_inventori() + "</a><br>");
				out.println("</div>");
				j++;
				if (j == 3) break;
			}
		}
		out.println("<h2>PIZZA</h2>");
		j = 0;
		for (int i=0; i<TabelBarang.size(); i++){
			if (TabelBarang.get(i).getId_kategori() == 2){
				out.println("<div class=\"barang\">");
				out.println("<img width=100px height=100px src=public/img/pizza/" + TabelBarang.get(i).getGambar() + " alt=" + TabelBarang.get(i).getNama_inventori() + " width = 150 height=300>");
				out.println("<br/><a href='detailBarang.jsp?idBarang="+(TabelBarang.get(i).getId_inventori()-1)+"'>"+TabelBarang.get(i).getNama_inventori() + "</a><br>");
				out.println("</div>");
				j++;
				if (j == 3) break;
			}
		}
		out.println("<h2>PASTA</h2>");
		j = 0;
		for (int i=0; i<TabelBarang.size(); i++){
			if (TabelBarang.get(i).getId_kategori() == 3){
				out.println("<div class=\"barang\">");
				out.println("<img width=100px height=100px src=public/img/pasta/" + TabelBarang.get(i).getGambar() + " alt=" + TabelBarang.get(i).getNama_inventori() + " width = 150 height=300>");
				out.println("<br/><a href='detailBarang.jsp?idBarang="+(TabelBarang.get(i).getId_inventori()-1)+"'>"+TabelBarang.get(i).getNama_inventori() + "</a><br>");
				out.println("</div>");
				j++;
				if (j == 3) break;
			}
		}
		out.println("<h2>DESSERTS</h2>");
		j = 0;
		for (int i=0; i<TabelBarang.size(); i++){
			if (TabelBarang.get(i).getId_kategori() == 4){
				out.println("<div class=\"barang\">");
				out.println("<img width=100px height=100px src=public/img/desserts/" + TabelBarang.get(i).getGambar() + " alt=" + TabelBarang.get(i).getNama_inventori() + " width = 150 height=300>");
				out.println("<br/><a href='detailBarang.jsp?idBarang="+(TabelBarang.get(i).getId_inventori()-1)+"'>"+TabelBarang.get(i).getNama_inventori() + "</a><br>");
				out.println("</div>");
				j++;
				if (j == 3) break;
			}
		}
		out.println("<h2>BEVERAGES</h2>");
		j = 0;
		for (int i=0; i<TabelBarang.size(); i++){
			if (TabelBarang.get(i).getId_kategori() == 5){
				out.println("<div class=\"barang\">");
				out.println("<img width=100px height=100px src=public/img/beverages/" + TabelBarang.get(i).getGambar() + " alt=" + TabelBarang.get(i).getNama_inventori() + " width = 150 height=300>");
				out.println("<br/><a href='detailBarang.jsp?idBarang="+(TabelBarang.get(i).getId_inventori()-1)+"'>"+TabelBarang.get(i).getNama_inventori() + "</a><br>");
				out.println("</div>");
				j++;
				if (j == 3) break;
			}
		}
	} else {
		response.sendRedirect("Favorit");
	}
	%>
	</div>
	<div class="centerbar">
		<h2>YOUR CART</h2>
		<%
			int total = 0;
			if (session.getAttribute("shoppingCart") != null) {
				ShoppingCart sc = (ShoppingCart) session.getAttribute("shoppingCart");
				out.println("");
				for (int i = 0; i < sc.getItems().size(); i++) {
					int temp = 0;
					for (int j = 0; j < TabelBarang.size(); j++) {
						if(TabelBarang.get(j).getId_inventori() == sc.getItems().get(i).getIdItem()){
							temp = j;
							break;
						}
					}
					out.println("(" + (i + 1) + ") " + sc.getItems().get(i).getQuantity() + "x " + TabelBarang.get(temp).getNama_inventori()+ " Rp. "+sc.getItems().get(i).getQuantity()*sc.getItems().get(i).getPrice() +",- <button>delete</button><br/>");
					total += sc.getItems().get(i).getQuantity()*sc.getItems().get(i).getPrice();
				}
			}
			out.println("<br/><b>Total price: Rp. " + total+",-</b>");
		%>
	</div>
		
	<%@include file="templates/footer.jsp"%>

	<div id="starter">
		<img class="animation" src="public/img/logo.png" width=500>
		<h2 class="text_animation">&#9733 &#9733 &#9733 &#9733 &#9733 dinner italian cuisine</h2>
	</div>
	
	<script>
		<% String message = request.getParameter("msg");
		if (message != null)
		%>
		Alert(<%=message%>);
	</script>

	<script>
		function fadein(){
			//---- WELCOME PROCESS ----\\
				var n = 0;
				var m = 1;
				// WELCOME FADE IN
				for (x=0;x<=20;x++){
					setTimeout(function(){
						document.getElementById('starter').style.opacity = 0.05*n;
						n++;
					}, ((50*(m+1))));
				m++;
				}
				
				// WELCOME FADE OUT
				m=0;
				for (x=0;x<=21;x++){
					setTimeout(function(){
						if(x>11) document.getElementById('starter').style.display="none";
						document.getElementById('starter').style.opacity = (0.05*n);
						n--;
					}, (3000+(50*(m+1))));
					m++;
				}
				
		}
		
		function transition(link){
			var n = 10;
			var m = 1;
			// CONTENT FADE OUT
			for (x=0;x<=10;x++){
				setTimeout(function(){
					document.getElementById('content_frame').style.opacity = 0.1*n;
					n--;
				}, (50*(m+1)));
			m++;
			}
			// LOGO FADE IN
			var o = 0;
			var p = 1;
			for (x=0;x<=10;x++){
				setTimeout(function(){
					document.getElementById('trans').style.opacity = (0.1*p);
					p++;
				}, (300+(50*(o+1))));
				o++;
			}
			//CHANGE LINK
				setTimeout(function(){
					document.getElementById('content_frame').src=link;
				}, 2000);
		}
	</script>
	<script>fadein();</script>
</body>
</html>
