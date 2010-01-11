<%@ page import="java.net.URLEncoder"%>
<%@ page import="oopSolidSample.models.*"%>
<%@ page import="oopSolidSample.controllers.*"%>
<%@ page import="oopSolidSample.models.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <h2>Select a game!</h2>
    
    <table>
        <tr>
            <th>Game</th>
            <th colspan="2" align="center">High Score</th>
        </tr>
        <c:forEach var="game" items="${Games}">
            <tr>
                                                <c:out value="${scheduledUser}"/>
                                        </c:forEach
    <% for (Game game : Games) { %>
        <tr>
            <td><a href="<%= URLEncoder.encode(game.Link, "UTF-8") %>"><%= URLEncoder.encode(game.Name, "UTF-8") %></a></td>
            <td>${game.HighScoreName}</td>
            <td><%= URLEncoder.encode(game.HighScore, "UTF-8") %></td>
        </tr>
    <% } %>
    </table>

