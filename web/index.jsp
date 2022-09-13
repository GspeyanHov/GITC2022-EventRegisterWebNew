<%@ page import="model.User" %>
<%@ page import="model.UserRole" %><%--
  Created by IntelliJ IDEA.
  User: SmartS
  Date: 02.09.2022
  Time: 4:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Event Manager</title>
</head>
<%
    User user = (User) session.getAttribute("user");
%>
<body>
<div style="width: 1000px; margin: 0 auto">
    <div>
        <div>
            <img src="/image/event day.png" width="1000px" height="500px">
        </div>
        Hello from Event Manager
        <br>
        <a href="/events">Show All Events</a>
        <%
            if (user != null && user.getUserRole() == UserRole.ADMIN) {
        %>
        <a href="/events/add">Add Event</a>
        <%}%>

        <%
            if (user != null) {
        %>
        <a href="/users">Show All Users</a>
        <a href="/logout">logout</a>
        <%} else {%>

        <a href="/users/add">Register</a>
        <a href="/login">Login</a>

        <%}%>
    </div>
</div>
</body>
</html>
