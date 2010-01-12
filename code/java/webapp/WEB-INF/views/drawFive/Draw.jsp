
<%@ page import="oopSolidSample.controllers.*"%>



	Draw


<form action="drawfive/draw" method="POST">

    <h2>Draw</h2>
    You drew the following cards:<br />
    <b>${model.Cards}</b><br /><br />
    Your score is: <b>${model.Score}</b><br /><br />
    <input id="Draw_Again" name="Draw_Again" type="submit" value="Draw Again" />

</form>
<br />
<hr />
<br />
<form action="/drawfive/savescore" method="POST">

    Save this score:<br />
    <input type="hidden" name="score" value="${model.Score}" />
    Name: <input type="text" name="Name" value="${model.Name}" />
    <input id="Save_Score" name="Save_Score" type="submit" value="Save Score" />

</form>


