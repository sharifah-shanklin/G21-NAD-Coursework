<%-- 
    Document   : AddCategory
    Created on : Aug 1, 2022, 2:49:01 PM
    Author     : Kanyike muhammed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
 <form action="AddCategoryProcess.jsp" method="post">
        <label>Enter category name</label>
        <br/>
        <input type="text" name="category_name" id="" placeholder="category name">
        <br/>
        <br/>
        <input type="number" name="longterm" id="" placeholder="longterm">
        <br/>
        <input type="submit" value="Create category">
</form>
