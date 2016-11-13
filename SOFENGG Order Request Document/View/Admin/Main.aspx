<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Admin.Main" %>

<%@ Import Namespace="SOFENGG_Order_Request_Document.Model" %>
<%@ Import Namespace="SOFENGG_Order_Request_Document.Model.Helper" %>

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
                            <h4>Processing: <b>
                                <asp:Label ID="lblProcessingCount" runat="server" /></b></h4>
                        </td>
                        <td class="warning">
                            <h4>Pending: <b>
                                <asp:Label ID="lblPendingCount" runat="server" /></b></h4>
                        </td>
                        <td class="success">
                            <h4>On Time: <b>
                                <asp:Label ID="lblOnTimeCount" runat="server" /></b></h4>
                        </td>
                        <td class="danger">
                            <h4>Late: <b>
                                <asp:Label ID="lblLateCount" runat="server" /></b></h4>
                        </td>
                        <td>
                            <h4>Total Quantity: <b>
                                <asp:Label ID="lblTotalCount" runat="server" /></b></h4>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <asp:Repeater ID="repOrders" runat="server">
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
                <tr class='<%#SetRowClass((OrderStatusEnum) Eval("OrderStatus")) %>'>
                    <td>
                        <asp:Label ID="lblReferenceNo" runat="server" Text='<%# Eval("ReferenceNo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblTransactionDate" runat="server" Text='<%# Eval("TransactionDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblDueDate" runat="server" Text='<%# Convert.ToDateTime(Eval("DueDate")).ToString("d") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# ((OrderStatusEnum) Eval("OrderStatus")).GetDescription() %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Receiver.FirstName") + " " + (!string.IsNullOrEmpty(Eval("Receiver.MiddleName").ToString()) ? Eval("Receiver.MiddleName") + " " : "") + Eval("Receiver.LastName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblAmount" runat="server" Text='<%# float.Parse(Eval("TotalAmount").ToString()).ToString("n2") %>' />
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
                    <td>OnTime</td>
                    <td>Watch Shock</td>
                    <td>300.00</td>
                </tr>--%>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script src="/Script/admin_main.js"></script>
</asp:Content>