<%--
  Created by IntelliJ IDEA.
  User: SmartS
  Date: 02.09.2022
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Event</title>
</head>
<body>
Please input event's data
<form action="/events/add" method="post">
    <input type="text" name="name" placeholder="please input name"> <br>
    <input type="text" name="place" placeholder="please input place"><br>
    Is online? <br>
    YES <input type="radio" name="isOnline" value="TRUE">
    NO <input type="radio" name="isOnline" value="FALSE"> <br>
    Event type
    <SELECT name="eventType">
        <option value="FILM">FILM</option>
        <option value="GAME">GAME</option>
        <option value="SPORT">SPORT</option>
    </SELECT>
    <br>
    Price
    <input type="number" name="price" placeholder="please input price">
    <br>
    <input type="date" name="eventDate">
    <br>
    <input type="submit" value="submit">
</form>
</body>
</html>
