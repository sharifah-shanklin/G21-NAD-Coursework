<%-- 
    Document   : EditProductDetails
    Created on : Aug 2, 2022, 5:35:51 PM
    Author     : Kanyike muhammed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <th>price</th>
            <th>category</th>
            <th>Action</th>
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
    <form method="post" action="EditProductDetailsProcess.jsp">
            <td>
                <input type="text" name="product_id" value=<%=resultSet.getString("product_id") %> hidden/>
                <input type="text" name="product_name" value=<%=resultSet.getString("name") %> />
            </td>
             <td>
                <input type="number" name="price" value=<%=resultSet.getString("price") %> />
            </td>
            <td>
                <%--<%=resultSet.getString("categories.name") %>--%>
                <%
                    try{
                        Class.forName("com.mysql.jdbc.Driver");// Driver to establish connection to the database
                        Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmshop","root",""); //Create connection using your ID and Password
                        Statement st2 = con1.createStatement();

                        String sql2 ="select * from categories";
                        ResultSet resultSet2 = st2.executeQuery(sql2);
                    while(resultSet2.next()){

                     %>


                         <input type="radio" id="category_id"
                                name="category_id" value='"+<%=resultSet2.getString("category_id") %>+"' 
                                <%=(resultSet.getString("categories.category_id").equals(resultSet2.getString("category_id")) ? "checked":"")%>
                                />
                        <label for="contergory_id"><%=resultSet2.getString("name") %></label>


                    <%
                    }
                    con2.close();
                    } catch (Exception e) {
                    e.printStackTrace();
                    }
                %> 
            </td>
            <td>
                
                <input type="submit" vslue="Update"/>
            </td>
    </form>
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