<%-- 
    Document   : users
    Created on : 29-Sep-2015, 9:56:32 PM
    Author     : awarsyle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accounts</title>
    </head>
    <body>
        <h1>Accounts</h1>

        <h3>Page ${page}</h3>

        <!-- display a table of all of the accounts -->
        <table border="1">
            <tr>
                <td>Name</td>
                <td>View</td>
            </tr>
            <c:forEach items="${accounts}" var="account">
                <tr>
                    <td>${account.name}</td>
                    <td><a href="account?username=${account.username}">view</a></td>
                </tr>
            </c:forEach>
        </table>

        <!-- handle paging: forward/back -->
        <c:if test="${page gt 1}">
            <a href="accounts?page=${page - 1}">&lt;</a> |     
        </c:if>
        <a href="accounts?page=${page + 1}">&gt;</a>
        <br>
        <br>

        <!-- handle paging: 10 links with current page not a link, we are on page ${page} -->
        
        <c:if test="${page le 5}">
            <c:forEach begin="1" end="10" var="i">
                <c:if test="${i != page}">
                    <a href="accounts?page=${i}">${i}</a>
                </c:if>
                <c:if test="${i eq page}">
                    ${page}
                </c:if>
            </c:forEach>
        </c:if>
        <c:if test="${page gt 5}">
            <c:forEach begin="${page - 5}" end="${page + 4}" var="i">
                <c:if test="${i != page}">
                    <a href="accounts?page=${i}">${i}</a>
                </c:if>
                <c:if test="${i eq page}">
                    ${page}
                </c:if>
            </c:forEach>
        </c:if>

    </body>
</html>
