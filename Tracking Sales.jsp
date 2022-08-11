<%-- 
    Document   : AddProduct
    Created on : Aug 1, 2022, 3:06:26 PM 
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
        <table id="table_2" class="display">
    <thead>
        <tr>
            <th>date</th>
            <th>total sales(ugx)</th>
            <!--fetch all the category names-->
            <%
            try{
                     Class.forName("com.mysql.jdbc.Driver");// Driver to establish connection to the database
                     Connection con0=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmshop","root",""); //Create connection using your ID and Password
                     Statement st0 = con0.createStatement();

                     String sql ="SELECT * from categories";
                     ResultSet resultSet0 = st0.executeQuery(sql);
                 while(resultSet0.next()){
                 
                  %>
                  <th>
                        <%=resultSet0.getString("name") %>
                        (orders)
                  </th>
                 <%
                 }
                 con0.close();
                 } catch (Exception e) {
                 e.printStackTrace();
                 }
        %>
        </tr>
    </thead>
    <tbody>
                    <%
                 try{
                     Class.forName("com.mysql.jdbc.Driver");// Driver to establish connection to the database
                     Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmshop","root",""); //Create connection using your ID and Password
                     Statement st1 = con1.createStatement();

                    String sql1 ="SELECT date, SUM(cart_total) from orders group by date";
                    ResultSet resultSet = st1.executeQuery(sql1);
                 while(resultSet.next()){
                 
                  %>
                  <tr>
                      <td>
                        <%=resultSet.getString(1) %>  
                      </td>
                      <td>
                          <%=resultSet.getString(2) %>
                      </td>
                      <!--fetch the sales per category-->
                    <%
                        String sql3 ="SELECT * from dailysales where date='"+resultSet.getString(1)+"'";
                        ResultSet resultSet3 = st1.executeQuery(sql3);
                        while(resultSet3.next()){
                        %>
                        <td>
                             <%=resultSet3.getString("totalSales") %>  
                        </td>
                        <%
                        }
                    %>
                     
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
        $('#table_2').DataTable({
            rowReorder: true
        });
    });
</script>
</html>