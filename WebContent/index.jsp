<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
				out.println("<br/>"+TabelBarang.get(i).getNama_inventori() + "<br>");
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
				out.println("<br/>"+TabelBarang.get(i).getNama_inventori() + "<br>");
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
				out.println("<br/>"+TabelBarang.get(i).getNama_inventori() + "<br>");
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
				out.println("<br/>"+TabelBarang.get(i).getNama_inventori() + "<br>");
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
				out.println("<br/>"+TabelBarang.get(i).getNama_inventori() + "<br>");
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
	</div>
	
	<%@include file="templates/footer.jsp"%>
</body>
</html>
