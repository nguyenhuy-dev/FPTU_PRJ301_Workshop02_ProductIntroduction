
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Category</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%@include file="../../header.jspf" %>
        <div class="alert" style="background-color: #00CCDD">
            <strong style="font-size: 40px; color: white">Update Category</strong>
        </div>
        <div class="container">
            <form class="form-horizontal" action="update" method="POST">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="typeId">Type ID:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" value="${requestScope.cat.typeId}" name="typeId" readonly="">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="categoryName">Category Name:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="Ex: Xe hơi" value="${requestScope.cat.categoryName}" name="categoryName">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="memo">Memo:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="Ex: Phương tiện giao thông" value="${requestScope.cat.memo}" name="memo">
                    </div>
                </div> 
                <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Save</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
