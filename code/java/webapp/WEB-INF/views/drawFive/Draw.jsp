
<%@ page import="oopSolidSample.controllers.*"%>



	Draw


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
    Name: <input type="text" name="Name" value="${model.name}" />
    <input id="Save_Score" name="Save_Score" type="submit" value="Save Score" />

</form>


