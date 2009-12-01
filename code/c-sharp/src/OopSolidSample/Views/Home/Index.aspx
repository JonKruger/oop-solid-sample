<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<HomeIndexViewModel>" %>
<%@ Import Namespace="OopSolidSample.Models.Home"%>
<%@ Import Namespace="MvcContrib.FluentHtml"%>
<%@ Import Namespace="Microsoft.Web.Mvc" %>
<%@ Import Namespace="OopSolidSample.Controllers"%>
<%@ Import Namespace="OopSolidSample.Models"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Select a game!
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Select a game!</h2>
    
    <table>
        <tr>
            <th>Game</th>
            <th colspan="2" align="center">High Score</th>
        </tr>
    <% foreach (var game in Model.Games) { %>
        <tr>
            <td><a href="<%= Html.Encode(game.Link) %>"><%= Html.Encode(game.Name) %></a></td>
            <td><%= Html.Encode(game.HighScoreName) %></td>
            <td><%= Html.Encode(game.HighScore) %></td>
        </tr>
    <% } %>
    </table>
</asp:Content>
