<%@ page import="java.net.URLEncoder"%>
<%@ page import="oopSolidSample.models.*"%>
<%@ page import="oopSolidSample.controllers.*"%>
<%@ page import="oopSolidSample.models.*"%>
<%@ page import="oopSolidSample.models.home.HomeIndexViewModel"%>

<jsp:useBean id="model" scope="request" class="oopSolidSample.models.home.HomeIndexViewModel"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link href="/content/Site.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <div class="page">

        <div id="header">
            <div id="title">
                <h1>&nbsp;</h1>
            </div>
              
            <div id="logindisplay">
                &nbsp;
            </div> 
            
            <div id="menucontainer">
            
                <ul id="menu">              
                    <li><a href="/Index.spr">Home</a></li>
                    <li><a href="/DrawFive/Index.spr">Play Draw Five</a></li>
                    <li><a href="/DrawFive/HighScores.spr">Draw Five High Scores</a></li>
                    <li><a href="/Blackjack/Index.spr">Play Blackjack</a></li>
                </ul>
            
            </div>
        </div>

        <div id="main">

    <h2>Select a game!</h2>
    
    <table>
        <tr>
            <th>Game</th>
            <th colspan="2" align="center">High Score</th>
        </tr>
  
    <% for (HomeIndexViewModel.GameViewModel game : model.Games) { %>
        <tr>
            <td><a href="<%= game.Link %>"><%= game.Name %></a></td>
            <td><%= game.HighScoreName %></td>
            <td><%= game.HighScore %></td>
        </tr>
    <% } %>
    </table>


            <div id="footer">
            </div>
        </div>
    </div>
</body>
</html>

