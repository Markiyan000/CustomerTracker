<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: marki
  Date: 04.02.2020
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Customers</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/additional/css/style.css">
</head>
<body>

<div id="wrapper">
    <div id="header">
        CRM - Customer Relationship Management
    </div>
</div>

<div id = "container">
    <div id="content">
        <input type="button" class="add-button" value="Add Customer" onclick="window.location.href = 'showFormForAdd'"/>
        <table>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th
            </tr>
            <c:forEach var="customer" items="${customers}">
                <c:url var = "updateLink" value="/customer/showFormForUpdate">
                    <c:param name="customerId" value="${customer.id}"></c:param>
                </c:url>
            <c:url var = "deleteLink" value="/customer/delete">
                <c:param name="customerId" value="${customer.id}"></c:param>
            </c:url>
                <tr>
                    <td>${customer.firstName}</td>
                    <td>${customer.lastName}</td>
                    <td>${customer.email}</td>
                    <td><a href = "${updateLink}">Update</a></td>
                    <td><a href = "${deleteLink}" onclick="if(!confirm('Are you really want to delete this customer?')) return false">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

</body>
</html>
