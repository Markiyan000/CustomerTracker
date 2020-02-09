<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: marki
  Date: 05.02.2020
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Save Customer</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/additional/css/style.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/additional/css/add-customer-style.css">
</head>
<body>
    <div id="wrapper">
        <div id="header">
            CRM - Customer Relationship Management
        </div>
    </div>

    <div id = "container">
        <h3>Save Customer</h3>
        <form:form action="saveCustomer" modelAttribute="customer" method="post">
            <form:hidden path="id"></form:hidden>
            <table>
                <tbody>
                    <tr>
                        <td><label>First Name:</label></td>
                        <td><form:input path="firstName"></form:input></td>
                    </tr>
                    <tr>
                        <td><label>Last Name:</label></td>
                        <td><form:input path="lastName"></form:input></td>
                    </tr>
                    <tr>
                        <td><label>Email:</label></td>
                        <td><form:input path="email"></form:input></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" class="save" value="Save"/>
        </form:form>
    </div>

    <p><a href="/customer/list">Back To List</a></p>

</body>
</html>
