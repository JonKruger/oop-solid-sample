<%@ page import="oopSolidSample.models.drawFive.*"%>
<%@ page import="oopSolidSample.models.*"%>
<%@ page import="oopSolidSample.domain.HighScore"%>

<jsp:useBean id="model" class="oopSolidSample.models.drawFive.DrawFiveHighScoresViewModel" scope="request" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Draw Five</title>
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

    <h2>High Scores</h2>

    <table>
        <tr>
            <th>Name</th>
            <th>Score</th>
        </tr>
        
    <% for (HighScore highScore : model.getHighScores()) { %>    
        <tr>
            <td><%= highScore.Name %></td>
            <td><%= highScore.Score %></td>
        </tr>
    <% } %>

	
    </table>

    
            <div id="footer">
            </div>
        </div>
    </div>
</body>
</html>
    