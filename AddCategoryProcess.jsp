<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String category_name=request.getParameter("category_name");
String longterm = request.getParameter("longterm");

try{

    Class.forName("com.mysql.jdbc.Driver");
    Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmshop","root","");
    Statement st1=con1.createStatement();
    String InsertQuery = "insert into categories (name,longterm) values('"+category_name+"','"+longterm+"');";

   

    st1.executeUpdate(InsertQuery);
    response.sendRedirect("index.jsp");
    }

catch(Exception error){
    out.println(error);}
 %>