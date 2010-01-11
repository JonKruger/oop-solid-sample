
<%@ page import="oopSolidSample.controllers.*"%>
<%@ page import="oopSolidSample.models.blackjack.*"%>



	Draw


<% Html.BeginForm<BlackjackController>(c => c.Draw()); %>

    <h2>Draw</h2>
    You drew the following cards:<br />
    <b><%= Html.Encode(Model.Cards) %></b><br /><br />
    Your score is: <b><%= Model.Score %></b><br /><br />
    <%= this.SubmitButton("Draw Again") %>

<% Html.EndForm(); %>


