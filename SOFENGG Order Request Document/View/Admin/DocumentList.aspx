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
                <asp:GridView ID="gvDocuments" AutoGenerateColumns="False" runat="server" OnRowEditing="gvDocuments_OnRowEditing" CssClass="table table-bordered table-hover table-striped" GridLines="Vertical" OnRowDeleting="gvDocuments_OnRowDeleting" OnRowUpdating="gvDocuments_OnRowUpdating" OnRowCancelingEdit="gvDocuments_OnRowCancelingEdit">
                    <Columns>
                        <asp:BoundField DataField="Id" ReadOnly="True" ItemStyle-CssClass="hide" HeaderStyle-CssClass="hide" />
                        <asp:TemplateField HeaderText="Document Name">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("Name") %>' ID="txtEditName" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="grpEditDocumentRow" ID="rfvName" runat="server" ControlToValidate="txtEditName" ErrorMessage="Cannot be empty."></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("Name") %>' ID="lbName"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Category">
                            <ItemTemplate>
                                <asp:Label ID="lblCategory" runat="server" Text='<%#((DocumentCategoryEnum)Eval("Category")).GetDescription() %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Regular Price">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("RegularPrice") %>' ID="txtEditRegularPrice" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="grpEditDocumentRow" ID="rfvRegularPrice" runat="server" ControlToValidate="txtEditRegularPrice" ErrorMessage="Regular price cannot be empty." Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ValidationGroup="grpEditDocumentRow" ID="rvRegularPrice" runat="server" ControlToValidate="txtEditRegularPrice" Type="Integer" MinimumValue="1" MaximumValue="10000" ErrorMessage="Regular price cannot be less than 1." Display="Dynamic"></asp:RangeValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("RegularPrice") %>' ID="lbRegularPrice"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Express Price">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("ExpressPrice") %>' ID="txtEditExpressPrice" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="grpEditDocumentRow" ID="rfvExpressPrice" runat="server" ControlToValidate="txtEditExpressPrice" ErrorMessage="Express price cannot be empty." Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ValidationGroup="grpEditDocumentRow" ID="rvExpressPrice" runat="server" ControlToValidate="txtEditExpressPrice" Type="Integer" MinimumValue="1" MaximumValue="10000" ErrorMessage="Express price cannot be less than 1." Display="Dynamic"></asp:RangeValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("ExpressPrice") %>' ID="lbExpressPrice"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Weight">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("Weight") %>' ID="txtEditWeight" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="grpEditDocumentRow" ID="rfvWeight" runat="server" ControlToValidate="txtEditWeight" ErrorMessage="Weight cannot be empty." Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ValidationGroup="grpEditDocumentRow" ID="rvWeight" runat="server" ControlToValidate="txtEditWeight" Type="Integer" MinimumValue="1" MaximumValue="10000" ErrorMessage="Weight cannot be less than 1." Display="Dynamic"></asp:RangeValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("Weight") %>' ID="lbWeight"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Maximum Copy">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("MaxCopy") %>' ID="txtEditMaxCopy" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="grpEditDocumentRow" ID="rfvMaxCopy" runat="server" ControlToValidate="txtEditMaxCopy" ErrorMessage="Maximum copy cannot be empty." Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ValidationGroup="grpEditDocumentRow" ID="rvMaxCopy" runat="server" ControlToValidate="txtEditMaxCopy" Type="Integer" MinimumValue="1" MaximumValue="10000" ErrorMessage="Maximum Copy cannot be less than 1." Display="Dynamic"></asp:RangeValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("MaxCopy") %>' ID="lblMaxCopy"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="For Undergraduate">
                            <EditItemTemplate>
                                <asp:CheckBox runat="server" Checked='<%# Bind("IsForUndergraduate") %>' ID="chEditForUndergraduate" class="form-control"></asp:CheckBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("IsForUndergraduate") %>' ID="lblForUndergraduate"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="For Graduate">
                            <EditItemTemplate>
                                <asp:CheckBox runat="server" Checked='<%# Bind("IsForGraduate") %>' ID="chEditForGraduate" class="form-control"></asp:CheckBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("IsForGraduate") %>' ID="lblForGraduate"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowEditButton="True" ValidationGroup="grpEditDocumentRow" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="content-main_buttons">
            <button class="btn btn-primary" id="add_button">Add Document</button>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="other" runat="server">
    <div class="popup-background">
        <div class="popup add">
            <p>Document Name</p>
            <asp:TextBox ID="txtName" class="form-control" type="text" placeholder="Document Name" runat="server" />
            <asp:RequiredFieldValidator ValidationGroup="grpEditDocumentRow" ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Name cannot be empty."></asp:RequiredFieldValidator>

            <p>Regular Charge</p>
            <asp:TextBox ID="txtRegularPrice" class="form-control" type="text" placeholder="Price" runat="server" />
            <asp:RequiredFieldValidator ValidationGroup="grpEditDocumentRow" ID="rfvRegularPrice" runat="server" ControlToValidate="txtRegularPrice" ErrorMessage="Regular price cannot be empty." Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RangeValidator ValidationGroup="grpEditDocumentRow" ID="rvRegularPrice" runat="server" ControlToValidate="txtRegularPrice" Type="Integer" MinimumValue="1" MaximumValue="10000" ErrorMessage="Regular price cannot be less than 1." Display="Dynamic"></asp:RangeValidator>

            <p>Express Price</p>
            <asp:TextBox ID="txtExpressPrice" class="form-control express_charge" type="text" placeholder="Price" runat="server" />
            <asp:RequiredFieldValidator ValidationGroup="grpEditDocumentRow" ID="rfvExpressPrice" runat="server" ControlToValidate="txtExpressPrice" ErrorMessage="Express price cannot be empty." Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RangeValidator ValidationGroup="grpEditDocumentRow" ID="rvExpressPrice" runat="server" ControlToValidate="txtExpressPrice" Type="Integer" MinimumValue="0" MaximumValue="10000" ErrorMessage="Express price cannot be less than 0." Display="Dynamic"></asp:RangeValidator>

            <p>Weight (gs.)</p>
            <asp:TextBox ID="txtWeight" class="form-control" type="text" placeholder="Weight" runat="server" />
            <asp:RequiredFieldValidator ValidationGroup="grpEditDocumentRow" ID="rfvWeight" runat="server" ControlToValidate="txtWeight" ErrorMessage="Weight cannot be empty." Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RangeValidator ValidationGroup="grpEditDocumentRow" ID="rvWeight" runat="server" ControlToValidate="txtWeight" Type="Integer" MinimumValue="1" MaximumValue="10000" ErrorMessage="Weight cannot be less than 1." Display="Dynamic"></asp:RangeValidator>

            <div>
                <asp:Button ID="btnAdd" Text="Add" CssClass="btn btn-success" OnClick="btnAdd_Click" runat="server" />
                <button id="btnAddCancel" class="btn btn-warning">Cancel</button>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script src="/Script/admin_document_list.js"></script>
</asp:Content>