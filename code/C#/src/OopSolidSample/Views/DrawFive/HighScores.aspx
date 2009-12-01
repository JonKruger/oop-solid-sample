<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="MvcContrib.FluentHtml.ModelViewPage<DrawFiveHighScoresViewModel>" %>
<%@ Import Namespace="OopSolidSample.Models.DrawFive"%>
<%@ Import Namespace="MvcContrib.FluentHtml"%>
<%@ Import Namespace="Microsoft.Web.Mvc" %>
<%@ Import Namespace="OopSolidSample.Controllers"%>
<%@ Import Namespace="OopSolidSample.Models"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	High Scores
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>High Scores</h2>

    <table>
        <tr>
            <th>Name</th>
            <th>Score</th>
        </tr>
    <% foreach (var highScore in Model.HighScores) { %>    
        <tr>
            <td><%= Html.Encode(highScore.Name) %></td>
            <td><%= highScore.Score %></td>
        </tr>
    <% } %>
    </table>

</asp:Content>
