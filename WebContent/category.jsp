<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="helloJsp.object.ShoppingCart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="public/css/style.css">
<script type="text/javascript" src="public/js/cart.js"></script>
<title>Insert title here</title>
</head>
<body class="container" alink=#000000 vlink=#000000>
	<%@ page import="java.util.ArrayList"%>
	<%@ page import="helloJsp.model.ModelInventori"%>
	<%
		ArrayList<ModelInventori> TabelBarang = new ArrayList<ModelInventori>();
	%>
	<%@include file="templates/header.jsp"%>
	<%
		String s = request.getParameter("idPage");
		int idKat = Integer.parseInt(s);
	%>
	<%
		TabelBarang = (ArrayList<ModelInventori>) session.getAttribute("tabel");

		String category = "";
		if (idKat == 1)
			category = "APPETIZER";
		else if (idKat == 2)
			category = "PIZZA";
		else if (idKat == 3)
			category = "PASTA";
		else if (idKat == 4)
			category = "DESSERTS";
		else if (idKat == 5)
			category = "BEVERAGES";

		out.println("<div class='leftbar'>");
		out.println("<h2>" + category + "</h2>");
	%>
	<div class="sort">
		<button
			onClick="location.href='Category?idPage=<%out.print(idKat);%>&type=1'">Sort
			by Nama</button>
		<button
			onClick="location.href='Category?idPage=<%out.print(idKat);%>&type=2'">Sort
			by Harga</button>
		<% 
		if(session.getAttribute("user") != null){
			if (session.getAttribute("user").equals("admin")) {
				out.println("<button onClick='location.href=updateBarang?type=2'>add NEW item</button>");
				}
		}
		%>
		<br /> <br />
	</div>

	<%
		for (int i = 0; i < TabelBarang.size(); i++) {
			if (TabelBarang.get(i).getId_kategori() == idKat) {
				out.println("<div class=\"barang\">");
				out.println("<img width=100px height=100px src=public/img/" + category.toLowerCase() + "/" + TabelBarang.get(i).getGambar() + " alt=" + TabelBarang.get(i).getNama_inventori() + " width = 150 height=300>");
				out.println("<br/><a href=detailBarang.jsp?idBarang=" + i + ">" + TabelBarang.get(i).getNama_inventori() + "</a><br>");
				out.println("Harga: " + TabelBarang.get(i).getHarga());
				out.println("<br/>Stok: " + TabelBarang.get(i).getJumlah());
				if (session.getAttribute("user") != null) {
					if (session.getAttribute("user").equals("admin")) {
						out.println("<button onClick=\"location.href='EditBarang?idBarang=" + (i+1) + "'\">EDIT</button>");
					} else {
						out.println("<br/><input id='num"+i+"' type='number' size=5 placeholder='jumlah'>");
						out.println("<input type='hidden' id='idPage' name='idPage' value=" + idKat + ">");
						out.println("<input type='submit' value='beli' onClick=\"addToCart(document.getElementById('num"+i+"').value,"+(i+1)+",'', "+TabelBarang.get(i).getJumlah()+","+TabelBarang.get(i).getHarga()+")\">");
					}
				}
				out.println("</div>");
			}
		}
		out.println("</div>");
	%>


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
					out.println("(" + (i + 1) + ") " + sc.getItems().get(i).getQuantity() + "x " + TabelBarang.get(temp).getNama_inventori()+ " Rp. "+sc.getItems().get(i).getQuantity()*sc.getItems().get(i).getPrice() +",- <button onClick='deleteFromCart("+ (i) +")'>delete</button><br/>");
					total += sc.getItems().get(i).getQuantity()*sc.getItems().get(i).getPrice();
				}
			}
			out.println("<br/><b>Total price: Rp. " + total+",-</b>");
		%>
	</div>

	<%@include file="templates/footer.jsp"%>
</body>
</html>
