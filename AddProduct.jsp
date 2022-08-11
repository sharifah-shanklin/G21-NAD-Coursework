<%-- 
    Document   : AddProduct
    Created on : Aug 1, 2022, 3:06:26 PM 
    Author     : Kanyike muhammed
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>


 <form action="AddProductProcess.jsp" method="post">
        <p>Register product</p>
        <p>
            <input type="text" name="pdt_name" id="" placeholder="pdt_name">
        </p>
        <p>
            <input type="number" name="cost" id="" placeholder="cost">
        </p>
        <p>Select the category where the product belongs</p>
        <div>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");// Driver to establish connection to the database
    Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmshop","root",""); //Create connection using your ID and Password
    Statement st1 = con1.createStatement();
    
    String sql ="select * from categories";
    ResultSet resultSet = st1.executeQuery(sql);
while(resultSet.next()){

 %>

    
     <input type="radio" id="category_id"
            name="category_id" value='"+<%=resultSet.getString("category_id") %>+"'>
    <label for="contergory_id"><%=resultSet.getString("name") %></label>


<%
}
con1.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 
 </div>
    <div>
        <button type="submit">Submit</button>
    </div>
</form>
