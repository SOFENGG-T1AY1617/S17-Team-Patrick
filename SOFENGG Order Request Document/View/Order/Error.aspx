<%@ Page Title="" Language="C#" MasterPageFile="~/Order/Order.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Content/css/error.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="error-message">
        <ol>
            <li class = "big-header"><b>Bummer.</b></li>
            <li>The page you have accessed is not available.</li>
        </ol>
    </div>
    <div class="return">
        <div class="col-xs-3">
            <a id="continue" href="/rules.html" class="btn btn-primary disabled">Return to Rules Page</a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="script" ContentPlaceHolderID="script" runat="server">
</asp:Content>