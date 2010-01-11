
<%@ page import="oopSolidSample.controllers.*"%>



	Draw


<% Html.BeginForm<DrawFiveController>(c => c.Draw()); %>

    <h2>Draw</h2>
    You drew the following cards:<br />
    <b><%= Html.Encode(Model.Cards) %></b><br /><br />
    Your score is: <b><%= Model.Score %></b><br /><br />
    <%= this.SubmitButton("Draw Again") %>

<% Html.EndForm(); %>
<br />
<hr />
<br />
<% Html.BeginForm<DrawFiveController>(c => c.SaveScore(null)); %>

    Save this score:<br />
    <%= this.Hidden(m => m.Score) %>
    Name: <%= this.TextBox(m => m.Name) %>
    <%= this.SubmitButton("Save Score") %>

<% Html.EndForm(); %>


