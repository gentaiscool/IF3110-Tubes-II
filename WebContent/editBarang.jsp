<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="public/css/style.css">
<title>Insert title here</title>
</head>
<body class="container" alink=#FFFFFF vlink=#FFFFFF>
	<%@ page import="java.util.ArrayList" %>
	<%@ page import="helloJsp.model.ModelInventori" %>
	<%
		//ArrayList<ModelInventori> TabelBarang = new ArrayList<ModelInventori>();
		ModelInventori barang = new ModelInventori();
	%>
	<%@include file="templates/header.jsp" %>
	<% 
		String s = request.getParameter("idBarang");
		int idBarang = Integer.parseInt(s);
	%>
	<%
		barang = (ModelInventori) session.getAttribute("barang");
		/*
		ModelInventori t1 = new ModelInventori();
		t1.setId_kategori(1);
		t1.setId_inventori(0);
		t1.setNama_inventori("aaa");
		t1.setGambar("public/img/banner.png");
		t1.setHarga(100);
		t1.setJumlah(100);
		TabelBarang.add(t1);
		ModelInventori t2 = new ModelInventori();
		t2.setId_kategori(1);
		t2.setId_inventori(1);
		t2.setNama_inventori("bbb");
		t2.setGambar("public/img/banner.png");
		t2.setHarga(150);
		t2.setJumlah(200);
		TabelBarang.add(t2);
		ModelInventori t3 = new ModelInventori();
		t3.setId_kategori(1);
		t3.setId_inventori(2);
		t3.setNama_inventori("ccc");
		t3.setGambar("public/img/banner.png");
		t3.setHarga(200);
		t3.setJumlah(300);
		TabelBarang.add(t3);
		ModelInventori t4 = new ModelInventori();
		t4.setId_kategori(3);
		t4.setId_inventori(3);
		t4.setNama_inventori("ddd");
		t4.setGambar("public/img/banner.png");
		t4.setHarga(300);
		t4.setJumlah(400);
		TabelBarang.add(t4);
		ModelInventori t5 = new ModelInventori();
		t5.setId_kategori(3);
		t5.setId_inventori(4);
		t5.setNama_inventori("eee");
		t5.setGambar("public/img/banner.png");
		t5.setHarga(500);
		t5.setJumlah(500);
		TabelBarang.add(t5);
		*/
		int idKat = barang.getId_kategori();
		String category = "";
		if(idKat == 1)
			category = "APPETIZER";
		else if(idKat == 2)
			category = "PIZZA";
		else if(idKat == 3)
			category = "PASTA";
		else if(idKat == 4)
			category = "DESSERTS";
		else if(idKat == 5)
			category = "BEVERAGES";
		out.println("<h3>"+barang.getNama_inventori()+"</h3>");
		
		//for (int i=0; i<TabelBarang.size(); i++){
			//if (TabelBarang.get(i).getId_kategori() == idKat){
				out.println("<div class=\"barang\">");
				out.println("<img width=100px height=100px src=public/img/"+category.toLowerCase()+"/"+barang.getGambar()+" alt="+barang.getNama_inventori()+" width = 150 height=300>");
				out.println("<br/>"+barang.getId_inventori()+">"+barang.getNama_inventori()+"<br>");
				out.println("Harga: " + barang.getHarga());
				out.println("<br/>Stok: " + barang.getJumlah());
				/*
				if (session.getAttribute("admin") != null){
					out.println("<input type='submit' value='edit'></form>");
				} else {
					out.println("<form><input type='number' size=5 placeholder='jumlah'>");
					out.println("<input type='submit' value='beli'></form>");
				}
				*/
				out.println("</div>");
			//}
		//}
	%>
	<%@include file="templates/footer.jsp" %>
</body>
</html>