<div class="header">
	<div class="logo">
		<a href="./index.jsp"><img src="public/img/canopy.png" width="100%"></a>
	</div>
	<div class="navigation">
		<a href="./category.jsp?idPage=1">
			<div id="navigator">APPETIZER</div>
		</a>
		<a href="./category.jsp?idPage=2">
			<div id="navigator">PIZZA</div>
		</a>
		<a href="./category.jsp?idPage=3">
			<div id="navigator">PASTA</div>
		</a>
		<a href="./category.jsp?idPage=4">
			<div id="navigator">DESSERTS</div>
		</a>
		<a href="./category.jsp?idPage=5">
			<div id="navigator">BEVERAGES</div>
		</a>
	</div>
	<%
		//allow access only if session exists
		String user = null;
		String userName = null;
		String sessionID = null;
		if (session.getAttribute("user") == null) {
			//response.sendRedirect("index.jsp");
			%>
			<div class="words">
				<h3>
				Ciao! Welcome to Chintalian! :3
				</h3>
				<button onClick="location.href='login.jsp'">Login</button>
				<button onClick="location.href='registrasi.jsp'">Registrasi user</button>
			</div>
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
			<div class="words">
				<h3>
				Hi
				<%=userName%>, Welcome to Chintalian! :3
				</h3>
				<button onClick="location.href='Logout'">Logout</button>
			</div>
			<%
		}
	%>
</div>