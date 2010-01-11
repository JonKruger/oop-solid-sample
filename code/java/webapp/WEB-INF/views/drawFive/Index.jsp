<%@ page import="oopSolidSample.controllers.*"%>
<%@ page import="oopSolidSample.models.*"%>


	Index




    <h2>Play Draw Five!</h2>
    
    <% Html.BeginForm<DrawFiveController>(c => c.Draw()); %>
    
    <%= this.SubmitButton("Draw Cards") %>
    
    <% Html.EndForm(); %>


