<%-- 
    Document   : TrackingSalesPerCategory
    Created on : Aug 9, 2022, 10:43:14 PM
    Author     : Kanyike muhammed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--get the order id as a parameter -->
<!--use the order id to obtain the categories as well as the dat-->
<!--basing on the date add the categories if not there else update the category sales-->
<%@page import="java.sql.*,java.util.*"%>

<%
Integer order_id = Integer.parseInt(request.getParameter("order_id"));

try{

    Class.forName("com.mysql.jdbc.Driver");// Driver to establish connection to the database
    Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmshop","root",""); //Create connection using your ID and Password
    
    Statement st2=con1.createStatement();
    
    String sql ="select * from orders WHERE order_id = "+order_id+"";
//    obatin the date
    ResultSet resultSet = st2.executeQuery(sql);
    while (resultSet.next()) {
        Statement st1=con1.createStatement();
//check if the dates is already in the database
        String sql2 ="select * from dailysales WHERE date="+resultSet.getString("date")+"";
        ResultSet resultSet2 = st1.executeQuery(sql2);
//        if the result is not there, insert all the available categories
        if(!resultSet2.next()){
            
//          fetching categories ids
           
            Statement st3=con1.createStatement();

            String sql3 ="select * from categories";
            ResultSet resultSet3 = st3.executeQuery(sql3);
            while(resultSet3.next()){
            Statement st4=con1.createStatement();
            String sql4 ="insert into dailysales(category_id) values("+resultSet3.getString("category_id")+")";
            st4.executeUpdate(sql4);
            }
        }
            //        update the dailysale for a particular category
            //find the number of products under each category that have been ordered already
                        Statement st5=con1.createStatement();

                        String sql5 = "SELECT SUM(ordered_products.product_id) AS total ,products.category_id,orders.date AS date FROM `ordered_products`JOIN orders ON orders.order_id = ordered_products.order_id JOIN products ON ordered_products.product_id = products.product_id WHERE orders.order_id='"+order_id+"' GROUP BY products.category_id"; 
                        ResultSet resultSet5 = st5.executeQuery(sql5);
                        while(resultSet5.next()){
            //         here we update the sales per category for this particular day
            //   first get the current number of sales for this day and later update
            //the category id comes from the latest query because its what has the latest number of newly added sales
                            Statement st6=con1.createStatement();
                            String sql6 ="select totalSales from  dailysales WHERE category_id='"+resultSet5.getString("category_id")+"' AND date='"+resultSet5.getString("date")+"'";
                            ResultSet resultSet6 = st6.executeQuery(sql6);
                            while(resultSet6.next()){
            //get the sales and increament them 
                                Statement st3=con1.createStatement();

                                Integer updatedSales = resultSet6.getInt(1)+ resultSet5.getInt("total");
                                String UpdateQuery = "update dailysales SET totalSales='"+updatedSales+"' WHERE category_id='"+resultSet5.getString("category_id")+"' AND date='"+resultSet5.getString("date")+"'";
                                st3.executeUpdate(UpdateQuery);
                            }
                        }
    
                    
    }
    
    }
catch(Exception error){
    out.println(error);}
 %>