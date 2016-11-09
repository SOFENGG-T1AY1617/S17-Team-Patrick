<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="SOFENGG_Order_Request_Document.Admin.Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <h3>Current Orders</h3>

    <form id="orderIDForm" runat="server" method="post">
        <asp:GridView ID="OrderListTable" runat="server" DataSourceID="orderListProductSource" DataKeyNames="referenceNo" AutoGenerateColumns="false" CcsClass="table table-hover">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HiddenField ID="hdnColorId" runat="server" value='<%DataBinder.Eval(Container.DataItem, "referenceNo") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Reference Number">
                <ItemTemplate>
                    <asp:LinkButton ID="lbPath" runat="server" Text="<%= referenceNo %>" OnClick="lbPath_Click"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Transaction Date" DataField="transactionDate"/>
            <asp:BoundField HeaderText="Due Date" DataField="dateDue"/>
            <asp:BoundField HeaderText="Status" DataField="status"/>
            <asp:BoundField HeaderText="Name" DataField="name"/>
            <asp:BoundField HeaderText="Amount" DataField="totalAmount"/>
        </Columns>
    </asp:GridView>
    </form>

   <%-- Uses report databind object from server --%>
    <div class="content-main_report">
        <p align="right">Total Quantity: <b><%= Report.total %></b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Late: <b><%= Report.late %></b>
        <p align="right">
            On Time: <b><%= Report.ontime %></b>
        </p>
    </div>
</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script src="/Script/admin_main.js"></script>
</asp:Content>