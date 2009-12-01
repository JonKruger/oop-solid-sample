<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<DrawFiveDrawViewModel>" %>
<%@ Import Namespace="MvcContrib.FluentHtml"%>
<%@ Import Namespace="OopSolidSample.Controllers"%>
<%@ Import Namespace="OopSolidSample.Models.DrawFive"%>
<%@ Import Namespace="System.Web.Mvc" %>
<%@ Import Namespace="Microsoft.Web.Mvc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Draw
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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

</asp:Content>
