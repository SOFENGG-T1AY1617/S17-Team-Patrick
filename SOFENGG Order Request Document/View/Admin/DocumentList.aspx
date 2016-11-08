<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DocumentList.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Admin.DocumentList" %>
<%@ Import Namespace="System.ComponentModel" %>
<%@ Import Namespace="SOFENGG_Order_Request_Document.Model" %>
<%@ Import Namespace="SOFENGG_Order_Request_Document.Model.Helper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Content/css/admin_document_list.css">
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
<div class="col-xs-2 content-sidebar">
    <h3>Menu</h3>
    <br>
    <ul>
        <li>
            <a href="admin_main.html">Home</a>
        </li>
        <li>
            <b>Maintain Document List</b>
        </li>
        <li>Update Operational Date</li>
    </ul>
    <br>
    <ul>
        <li>Current Orders</li>
        <li>Pending Orders</li>
        <li>Cancelled Orders</li>
        <li>Previous Orders</li>
    </ul>
</div>
<div class="col-xs-9 col-xs-offset-1 content-main">
<h3>Document List</h3>

<div class="content-scrolling">
    <div>
        <asp:GridView ID="gvDocuments" AutoGenerateColumns="False" runat="server" OnRowEditing="gvDocuments_OnRowEditing" CssClass="table table-hover" GridLines="Vertical" OnRowDeleting="gvDocuments_OnRowDeleting" OnRowUpdating="gvDocuments_OnRowUpdating" OnRowCancelingEdit="gvDocuments_OnRowCancelingEdit">
            <Columns>
                <asp:BoundField DataField="Id" ReadOnly="True" ItemStyle-CssClass="hide" HeaderStyle-CssClass="hide"/>
                <asp:BoundField DataField="Name" HeaderText="Document Name"/>
                <asp:TemplateField HeaderText="Category">
                    <ItemTemplate>
                        <%#((DocumentCategoryEnum)Eval("Category")).GetDescription() %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="RegularPrice" HeaderText="Regular Price" />
                <asp:BoundField DataField="ExpressPrice" HeaderText="Express Price"/>
                <asp:BoundField DataField="Weight" HeaderText="Weight"/>
                <asp:CommandField ShowEditButton="True"/>
                <asp:CommandField ShowDeleteButton="True"/>
            </Columns>
        </asp:GridView>
    </div>
</div>
<div class="content-main_report">
    <button class="btn btn-primary" id="add_button">Add Document</button>
</div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="other" runat="server">

    <div class="popup add">
            <p>Document Name</p>
            <asp:TextBox id="txtName" class="form-control" type="text" placeholder="Document Name"  runat="server"/>
            <p>Regular Charge</p>
            <asp:TextBox id="txtRegularPrice" class="form-control" type="text" placeholder="Price"  runat="server"/>
            <p>
                <asp:TextBox id="cbExpressPrice" class="available_express" type="checkbox" checked="checked" Text="Express Charge"  runat="server"/>
            </p>
            <asp:TextBox id="txtExpressPrice" class="form-control express_charge" type="text" placeholder="Price" runat="server"/>
            <p>Weight (gs.)</p>
            <asp:TextBox id="txtWeight" class="form-control" type="text" placeholder="Weight"  runat="server"/>
            <div>
                <asp:Button id="btnAdd" Text="Add" CssClass="btn btn-success" OnClick="btnAdd_Click" runat="server" />
                <button id="btnAddCancel" class="btn btn-warning">Cancel</button>
            </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script src="/Script/admin_document_list.js"></script>
</asp:Content>