<%@ page import="model.Event" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: SmartS
  Date: 02.09.2022
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add User</title>
</head>
<body>

<%
    List<Event> events = (List<Event>) request.getAttribute("events");
%>
Please input user's data
<form action="/users/add" method="post">
    <input type="text" name="name" placeholder="please input name"> <br>
    <input type="text" name="surname" placeholder="please input surname"><br>
    <input type="email" name="email" placeholder="please input email"> <br>
    <SELECT name="eventId">
            <%for (Event event : events) {%>
        <option value="<%=event.getId()%>"><%=event.getName()%> <%=event.getPlace()%> (<%=event.getPrice()%>)</option>


            <%}%>

        <input type="submit" value="register">

</form>
</body>
</html>
