<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<EmptyViewModel>" %>
<%@ Import Namespace="MvcContrib.FluentHtml"%>
<%@ Import Namespace="Microsoft.Web.Mvc" %>
<%@ Import Namespace="OopSolidSample.Controllers"%>
<%@ Import Namespace="OopSolidSample.Models"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Play Blackjack!</h2>
    
    <% Html.BeginForm<BlackjackController>(c => c.Draw()); %>
    
    <%= this.SubmitButton("Draw Cards") %>
    
    <% Html.EndForm(); %>

</asp:Content>
