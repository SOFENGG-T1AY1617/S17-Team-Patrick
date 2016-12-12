<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Content/css/error.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="jumbotron">
        <div class="container">
            <h1>Bummer.</h1>
            <p>
                The page you have accessed is not available.
            </p>
            <a id="continue" href="Rules.aspx" class="btn btn-primary">Return to Rules Page</a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="script" ContentPlaceHolderID="script" runat="server">
</asp:Content>