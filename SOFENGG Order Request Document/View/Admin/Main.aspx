<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Admin.Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Content/css/admin_main.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="col-xs-2 content-sidebar">
        <h3>Menu</h3>
        <br>
        <ul>
            <li>
                <b>Home</b>
            </li>
            <li>
                <a href="admin_document_list.html">Maintain Document List</a>
            </li>
            <li>Update Operational Date</li>
        </ul>
        <br>
        <ul>
            <li>Current Orders</li>
            <li>
                <a href="admin_pending.html">Pending Orders</a>
            </li>
            <li>Cancelled Orders</li>
            <li>Previous Orders</li>
        </ul>
    </div>
    <div class="col-xs-9 col-xs-offset-1 content-main">
        <div class="main_report">
            <div class="main_report-left">
                <h3>Current Orders</h3>
            </div>
            <div class="main_report-right">
                <table class="table table-bordered">
                    <tr>
                        <td>
                            <h4>Processing: <b>5</b></h4>
                        </td>
                        <td class="warning">
                            <h4>Pending: <b>5</b></h4>
                        </td>
                        <td class="success">
                            <h4>On Time: <b>5</b></h4>
                        </td>
                        <td class="danger">
                            <h4>Late: <b>5</b></h4>
                        </td>
                        <td>
                            <h4>Total Quantity: <b>30</b></h4>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <asp:Repeater ID="rptCustomers" runat="server">
            <HeaderTemplate>
                <table class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <td>Reference Number</td>
                            <td>Transaction Date</td>
                            <td>Date Due</td>
                            <td>Status</td>
                            <td>Name</td>
                            <td>Amount</td>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label ID="lblReferenceNo" runat="server" Text='<%# Eval("CustomerId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblTransactionDate" runat="server" Text='<%# Eval("ContactName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblDueDate" runat="server" Text='<%# Eval("Country") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Country") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Country") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("Country") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
            </table>
            </FooterTemplate>
        </asp:Repeater>

        <%--                <tr class="success">
                    <td>3</td>
                    <td>11/10/2016</td>
                    <td>11/11/2016</td>
                    <td>Done</td>
                    <td>Watch Shock</td>
                    <td>300.00</td>
                </tr>--%>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script src="/Script/admin_main.js"></script>
</asp:Content>