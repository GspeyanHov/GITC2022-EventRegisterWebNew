<%@ page import="model.Event" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: SmartS
  Date: 02.09.2022
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Events page</title>
</head>
<body>
<%
    List<Event> events = (List<Event>) request.getAttribute("events");
%>
<table border="1">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>place</th>
        <th>isOnline</th>
        <th>event_type</th>
        <th>price</th>
        <th>event_date</th>
        <th>action</th>

    </tr>
    <%
        for (Event event : events) { %>
    <tr>
        <td><%=event.getId()%>
        </td>
        <td><%=event.getName()%>
        </td>
        <td><%=event.getPlace()%>
        </td>
        <td><%=event.isOnline()%>
        </td>
        <td><%=event.getEventType().name()%>
        </td>
        <td><%=event.getPrice()%>
        </td>
        <td><%=event.getEventDate()%>

        </td>
        <td>
            <a href="/events/remove?eventId=<%=event.getId()%>">Remove</a>
            <a href="/events/edit?eventId=<%=event.getId()%>">Edit</a>

        </td>

    </tr>
    <% } %>
</table>
</body>

</html>
