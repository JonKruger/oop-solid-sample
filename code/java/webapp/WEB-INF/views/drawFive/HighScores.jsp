<%@ page import="oopSolidSample.models.drawFive.*"%>
<%@ page import="oopSolidSample.models.*"%>
<%@ page import="oopSolidSample.domain.HighScore"%>

    <h2>High Scores</h2>

    <table>
        <tr>
            <th>Name</th>
            <th>Score</th>
        </tr>
    <% for (HighScore highScore : model.HighScores) { %>    
        <tr>
            <td><%= highScore.Name %></td>
            <td><%= highScore.Score %></td>
        </tr>
    <% } %>
    </table>
