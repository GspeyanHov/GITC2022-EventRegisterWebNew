<%@ page import="java.util.List" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: SmartS
  Date: 04.09.2022
  Time: 7:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users page</title>
</head>
<body>
<%
    List<User> users = (List<User>) request.getAttribute("users");
%>
<table border="1">
    <tr>
        <th>image</th>
        <th>id</th>
        <th>name</th>
        <th>surname</th>
        <th>email</th>
        <th>event name and place</th>
        <th>action</th>

    </tr>
    <%
        for (User user : users) { %>
    <tr>
        <td><%
            if (user.getProfilePic() == null || user.getProfilePic().length() == 0) {
        %>
            <img src="/image/Screenshot_6.png" width="100"/>
            <%} else {%>
            <img src="/getImage?profilePic=<%=user.getProfilePic()%>" width="100"/>
            <%}%>
        </td>
        <td><%=user.getId()%>
        </td>
        <td><%=user.getName()%>
        </td>
        <td><%=user.getSurname()%>
        </td>
        <td><%=user.getEmail()%>
        </td>
        <td>
            <% if (user.getEvent() != null) {%>
            <%=user.getEvent().getName()%>|
            <%=user.getEvent().getPlace()%>

            <%} else {%>
            <span style="color: red"> no event</span>
            <%}%>
        </td>
        <td>
            <a href="/users/remove?userId=<%=user.getId()%>">Remove</a>
            <a href="/users/edit?userId=<%=user.getId()%>">Edit</a>

        </td>
    </tr>
    <% } %>
</table>
</body>
</html>
