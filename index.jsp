<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="dashboard.css">
   
    <title>Admin</title>

</head>
<body>
   <!--Navigation bar-->
   <jsp:include page="../secondNavigationBar.jsp"/>
    <!--Main-->
   <div class="main">
        <a href="EditProductDetails.jsp">Edit products</a>
        <a href="Tracking Sales.jsp">Track sales</a>
        <jsp:include page="ProductsDetails.jsp"/>
        <jsp:include page="AddCategory.jsp"/>
        <jsp:include page="AddProduct.jsp"/> 
        <h1>Tracking sales per category</h1>
        <%--<jsp:include page="TrackingSalesPerCategory.jsp"/>--%> 
        <jsp:include page="Tracking Sales.jsp"/> 
        
   </div>
    </body>
</html>
