<%@ page import="oopSolidSample.models.drawFive.*"%>
<%@ page import="oopSolidSample.models.*"%>
<%@page import="oopSolidSample.domain.HighScore"%>
<%@page import="java.net.URLEncoder"%>

    <h2>High Scores</h2>

    <table>
        <tr>
            <th>Name</th>
            <th>Score</th>
        </tr>
    <% for (HighScore highScore : HighScores) { %>    
        <tr>
            <td><%= URLEncoder.encode(highScore.Name, "UTF-8") %></td>
            <td><%= highScore.Score %></td>
        </tr>
    <% } %>
    </table>
