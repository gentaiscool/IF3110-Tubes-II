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
	<%@ page import="helloJsp.model.ModelInventori" %>
	<%@ include file="templates/header.jsp" %>
	<%@ page import="java.util.ArrayList" %>
	<% 
		int idBarang = Integer.parseInt(request.getParameter("idBarang"));
	
		ArrayList<ModelInventori> TabelBarang = new ArrayList<ModelInventori>();
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
		
		out.println("<div class='title'>KATEGORI</div>");
		out.println("<div class=\"detailBarang\">");
		out.println("<div class='segment' style='position:relative;top:10%;left:0%'>");
		out.println("<img width=350px height=200px src="+TabelBarang.get(idBarang).getGambar()+" alt="+TabelBarang.get(idBarang).getNama_inventori()+" width = 150 height=300>");
		out.println("</div>");
		out.println("<div class='segment'>");
		out.println("<h1>"+TabelBarang.get(idBarang).getNama_inventori()+"</h1>");
		out.println("ayam dimasak dengan creamy soury sup jamur");
		out.println("<br/>ditambah dengan kesegaran alami dan bumbu kacang segar");
		out.println("<br/>Rp." + TabelBarang.get(idBarang).getHarga() + ",00 per porsi");
		out.println("<br/>"+TabelBarang.get(idBarang).getJumlah() + " stok tersisa");
		out.println("<br/><br/><textarea></textarea><form><input type='number' size=10 placeholder='jumlah'>");
		out.println("<input type='submit' value='beli'></form>");
		out.println("</div>");
		out.println("</div>");
		
		
	%>
	<%@include file="templates/footer.jsp" %>
</body>
</html>