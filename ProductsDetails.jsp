<%-- 
    Document   : ProductsDetails
    Created on : Aug 2, 2022, 5:29:56 PM
    Author     : Kanyike muhammed
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src="./DataTables/jquery.js"></script>
    <link rel="stylesheet" href="./DataTables/datatables.css">
    <script src="./DataTables/datatables.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
        <table id="table_id" class="display">
    <thead>
        <tr>
            <th>Name</th>
            <th>category</th>
            <th>likes</th>
        </tr>
    </thead>
    <tbody>
       <%
try{
    Class.forName("com.mysql.jdbc.Driver");// Driver to establish connection to the database
    Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmshop","root",""); //Create connection using your ID and Password
    Statement st1 = con1.createStatement();
    
    String sql ="select * from products INNER JOIN categories ON products.category_id = categories.category_id";
    ResultSet resultSet = st1.executeQuery(sql);
while(resultSet.next()){

 %>

    
     
     <tr>
            <td><%=resultSet.getString("name") %></td>
            <td><%=resultSet.getString("categories.name") %></td>
            <td><%=resultSet.getString("likes") %></td>
    </tr>


<%
}
con1.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 
        </tbody>
</table>
</body>
<script>
    $(document).ready(function () {
        $('#table_id').DataTable({
            rowReorder: true
        });
    });
</script>
</html>