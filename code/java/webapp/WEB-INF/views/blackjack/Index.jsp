<%@ page import="oopSolidSample.controllers.*"%>
<%@ page import="oopSolidSample.models.*"%>


	Index




    <h2>Play Blackjack!</h2>
    
    <% Html.BeginForm<BlackjackController>(c => c.Draw()); %>
    
    <%= this.SubmitButton("Draw Cards") %>
    
    <% Html.EndForm(); %>


