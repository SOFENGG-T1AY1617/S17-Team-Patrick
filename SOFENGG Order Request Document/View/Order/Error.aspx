<%@ Page Title="" Language="C#" MasterPageFile="~/Order/Order.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.Error" %>
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
            <a id="continue" href="/rules.html" class="btn btn-primary">Return to Rules Page</a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="script" ContentPlaceHolderID="script" runat="server">
</asp:Content>