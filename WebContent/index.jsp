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
	<%@include file="templates/header.jsp"%>
	<%
		//allow access only if session exists
		String user = null;
		String userName = null;
		String sessionID = null;
		if (session.getAttribute("user") == null) {
			//response.sendRedirect("index.jsp");
			%>
			<h3>
			Ciao! Welcome to Chintalian! :3
			</h3>
			<button onClick="location.href='login.jsp'">Login</button>
		<%
		} else{
			user = (String) session.getAttribute("user");		
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("user"))
						userName = cookie.getValue();
					if (cookie.getName().equals("JSESSIONID"))
						sessionID = cookie.getValue();
				}
			}
			%>
			
			<h3>
			Hi
			<%=userName%>, Welcome to Chintalian! :3
			</h3>
			<button onClick="location.href='Logout'">Logout</button>
			<%
		}
	%>

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
	<%@include file="templates/footer.jsp"%>
</body>
</html>
