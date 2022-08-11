<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String category_id = request.getParameter("category_id");
String pdt_name = request.getParameter("pdt_name");
String cost = request.getParameter("cost");
String description = request.getParameter("description");

try{

    Class.forName("com.mysql.jdbc.Driver");// Driver to establish connection to the database
    Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmshop","root",""); //Create connection using your ID and Password
    
    Statement st2=con1.createStatement();
    
    String sql ="select * from categories WHERE category_id = "+category_id +"";
    ResultSet resultSet = st2.executeQuery(sql);
    while (resultSet.next()) {
        Statement st1=con1.createStatement();
        String InsertQuery = "insert into products (name,price,category_id) values('"+pdt_name+"','"+cost+"','"+resultSet.getString("category_id")+"');";
        st1.executeUpdate(InsertQuery);
        response.sendRedirect("index.jsp");
    }
    
    }


    
    

   
   

catch(Exception error){
    out.println(error);}
 %>