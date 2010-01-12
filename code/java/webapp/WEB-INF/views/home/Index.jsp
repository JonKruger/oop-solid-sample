<%@ page import="java.net.URLEncoder"%>
<%@ page import="oopSolidSample.models.*"%>
<%@ page import="oopSolidSample.controllers.*"%>
<%@ page import="oopSolidSample.models.*"%>
<%@ page import="oopSolidSample.models.home.HomeIndexViewModel"%>

<jsp:useBean id="model" scope="request" class="oopSolidSample.models.home.HomeIndexViewModel"/>
    <h2>Select a game!</h2>
    
    <table>
        <tr>
            <th>Game</th>
            <th colspan="2" align="center">High Score</th>
        </tr>
  
    <% for (HomeIndexViewModel.GameViewModel game : model.Games) { %>
        <tr>
            <td><a href="<%= game.Link %>"><%= game.Name %></a></td>
            <td>${game.HighScoreName}</td>
            <td><%= game.HighScore %></td>
        </tr>
    <% } %>
    </table>

