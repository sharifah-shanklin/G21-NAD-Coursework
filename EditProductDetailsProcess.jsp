<%-- 
    Document   : EditProductDetailsProcess
    Created on : Aug 4, 2022, 12:06:51 PM
    Author     : Kanyike muhammed
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>



<%
Integer pdt_id = Integer.parseInt(request.getParameter("product_id"));
String category_id = request.getParameter("category_id");
String pdt_name = request.getParameter("product_name");
Integer price = Integer.parseInt(request.getParameter("price"));

try{

    Class.forName("com.mysql.jdbc.Driver");// Driver to establish connection to the database
    Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmshop","root",""); //Create connection using your ID and Password
    
    Statement st2=con1.createStatement();
    
    String sql ="select * from categories WHERE category_id = "+category_id+";";
    ResultSet resultSet = st2.executeQuery(sql);
    while (resultSet.next()) {
        Statement st1=con1.createStatement();
        
        String UpdateQuery = "update products SET price="+price+" , name='"+pdt_name+"',category_id='"+resultSet.getString("category_id")+"' WHERE product_id ="+pdt_id+"  ;";
        st1.executeUpdate(UpdateQuery);
        response.sendRedirect("EditProductDetails.jsp");
    }
    
    }


    
    

   
   

catch(Exception error){
    out.println(error);}
 %>