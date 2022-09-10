<%@ page import="model.Event" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="model.EventType" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: SmartS
  Date: 02.09.2022
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update event</title>
</head>
<body>

<%
    Event event = (Event) request.getAttribute("events");

%>
Please update event's data
<form action="/events/edit" method="post">
    <input type="hidden" name="eventId" value="<%=event.getId()%>">
    <input type="text" name="name" value="<%=event.getName()%>"> <br>
    <input type="text" name="place" value="<%=event.getPlace()%>"><br>
    Is Online? <br>
    YES <input checked type="radio" name="isOnline" value="<%=event.isOnline()%> TRUE">
    NO <input type="radio" name="isOnline" value="<%=event.isOnline()%> FALSE"> <br>
    Event type <br>
    <select name="eventType">
        <option value="FILM">FILM</option>
        <option value="GAME">GAME</option>
        <option value="SPORT">SPORT</option>
    </select>
    price
    <input type="number" name="price" value="<%=event.getPrice()%>"> <br>
    <%if (event.getEventDate() != null) {%>
    <input onfocus="(this.type = 'date')" type="text" name="eventDate" placeholder="<%=event.getEventDate()%> "
           size="25%">
    <%} else {%>
    <span style="color: green">No event date selected</span>
    <%}%>
    <input type="submit" value="update">


</form>
</body>
</html>
