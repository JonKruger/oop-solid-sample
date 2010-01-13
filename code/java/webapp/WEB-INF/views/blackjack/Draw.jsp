
<%@ page import="oopSolidSample.controllers.*"%>
<%@ page import="oopSolidSample.models.blackjack.*"%>



	Draw


<form action="Draw.spr" method="POST">

    <h2>Draw</h2>
    You drew the following cards:<br />
    <b>${model.cards}</b><br /><br />
    Your score is: <b>${model.score}</b><br /><br />
    <input id="Draw_Again" name="Draw_Again" type="submit" value="Draw Again" />

</form>


