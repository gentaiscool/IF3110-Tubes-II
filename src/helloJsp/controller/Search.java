package helloJsp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Search() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String item = request.getParameter("item");
		if (item != null){
			ArrayList<String> listNama = new ArrayList<String>();
			ArrayList<Integer> listId = new ArrayList<Integer>();
			DbConnector dbconnector = new DbConnector();
			Connection connection = dbconnector.mySqlConnection();
			HttpSession session = request.getSession();
			PrintWriter out = response.getWriter();
			try {
				Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery("select * from inventori;");
				while (rs.next()) {
					listNama.add(rs.getString("nama_inventori").toLowerCase());
					listId.add(rs.getInt("id_inventori"));
				}
				/*
				for($i=0; $i<count($a); $i++)
				{
					if (strtolower($q)==strtolower(substr($a[$i],0,strlen($q))))
					{
						$temp = '<li><a href="detailbarang.php?id='.($i+1).'">'.$a[$i].'</a></li>';
						$hint=$hint.$temp;
					}
				}
				*/
				String result = "";
				for (int i=0; i<listNama.size(); i++){
					if (item.toLowerCase().equals(listNama.get(i).substring(0,item.length()))){
						result+=("<li><a href='detailBarang.jsp?idBarang="+listId.get(i)+"'>"+listNama.get(i)+"</a></li>");
					}
				}
				
				session.setAttribute("result", result);
				// setting session to expiry in 30 mins
				// session.setMaxInactiveInterval(10);
				response.sendRedirect("index.jsp");
			} catch (Exception e) {
				out.println("Ch si");
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String item = request.getParameter("item");
		if (item != null){
			ArrayList<String> listNama = new ArrayList<String>();
			ArrayList<Integer> listId = new ArrayList<Integer>();
			DbConnector dbconnector = new DbConnector();
			Connection connection = dbconnector.mySqlConnection();
			HttpSession session = request.getSession();
			PrintWriter out = response.getWriter();
			try {
				Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery("select * from inventori;");
				while (rs.next()) {
					listNama.add(rs.getString("nama_inventori").toLowerCase());
					listId.add(rs.getInt("id_inventori"));
				}
				/*
				for($i=0; $i<count($a); $i++)
				{
					if (strtolower($q)==strtolower(substr($a[$i],0,strlen($q))))
					{
						$temp = '<li><a href="detailbarang.php?id='.($i+1).'">'.$a[$i].'</a></li>';
						$hint=$hint.$temp;
					}
				}
				*/
				String result = "";
				for (int i=0; i<listNama.size(); i++){
					if (item.toLowerCase().equals(listNama.get(i).substring(0,item.length()))){
						result+=("<li><a href='detailBarang.jsp?idBarang="+listId.get(i)+"'>"+listNama.get(i)+"</a></li>");
					}
				}
				
				session.setAttribute("result", result);
				// setting session to expiry in 30 mins
				// session.setMaxInactiveInterval(10);
				response.sendRedirect("index.jsp");
			} catch (Exception e) {
				out.println("Ch si");
				e.printStackTrace();
			}
		}
	}
}
