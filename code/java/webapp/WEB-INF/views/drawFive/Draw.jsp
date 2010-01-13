
<%@ page import="oopSolidSample.controllers.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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


<form action="Draw.spr" method="POST">

    <h2>Draw</h2>
    You drew the following cards:<br />
    <b>${model.cards}</b><br /><br />
    Your score is: <b>${model.score}</b><br /><br />
    <input id="Draw_Again" name="Draw_Again" type="submit" value="Draw Again" />

</form>
<br />
<hr />
<br />
<form action="SaveScore.spr" method="POST">

    Save this score:<br />
    <input type="hidden" name="score" value="${model.score}" />
    Name: <input type="text" name="name" value="${model.name}" />
    <input id="Save_Score" name="Save_Score" type="submit" value="Save Score" />

</form>


            <div id="footer">
            </div>
        </div>
    </div>
</body>
</html>

