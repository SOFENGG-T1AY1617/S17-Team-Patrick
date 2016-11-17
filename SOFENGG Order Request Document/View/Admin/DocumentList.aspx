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
    <asp:ScriptManager ID="sm" runat="server" EnablePageMethods="true" EnablePartialRendering="true"></asp:ScriptManager>

    <div class="jumbotron">
        <h2>Document List</h2>
        <input type="button" class="btn btn-primary" data-toggle="modal" data-target="#dlgAddDocument" value="Add Document"/>
    </div>

    <div class="content-main table-responsive">
            <div class="document_table">
                <asp:GridView ID="gvDocuments" AutoGenerateColumns="False" runat="server" OnRowEditing="gvDocuments_OnRowEditing" CssClass="table table-bordered table-hover table-fluid" GridLines="Vertical" OnRowDeleting="gvDocuments_OnRowDeleting" OnRowUpdating="gvDocuments_OnRowUpdating" OnRowCancelingEdit="gvDocuments_OnRowCancelingEdit">
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
                                <asp:RangeValidator ValidationGroup="grpEditDocumentRow" ID="rvExpressPrice" runat="server" ControlToValidate="txtEditExpressPrice" Type="Integer" MinimumValue="0" MaximumValue="10000" ErrorMessage="Express price cannot be less than 0." Display="Dynamic"></asp:RangeValidator>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="other" runat="server">

    <div class="modal fade" id="dlgAddDocument" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="popup_center_align">Add Document</h3>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                    <div class="form-group">
                        <label for="txtName" class="col-sm-5 control-label">Document Name</label>
                        <div class="col-sm-5">
                            <asp:TextBox ID="txtName" class="form-control" type="text" placeholder="Document Name" runat="server" />
                            <asp:RequiredFieldValidator ValidationGroup="grpAddDocumentRow" ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Name cannot be empty."></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="txtRegularPrice" class="col-sm-5 control-label">Regular Charge</label>
                        <div class="col-sm-5">
                            <asp:TextBox ID="txtRegularPrice" class="form-control" type="text" placeholder="Price" runat="server" />
                            <asp:RequiredFieldValidator ValidationGroup="grpAddDocumentRow" ID="rfvRegularPrice" runat="server" ControlToValidate="txtRegularPrice" ErrorMessage="Regular price cannot be empty." Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ValidationGroup="grpAddDocumentRow" ID="rvRegularPrice" runat="server" ControlToValidate="txtRegularPrice" Type="Integer" MinimumValue="1" MaximumValue="10000" ErrorMessage="Regular price cannot be less than 1." Display="Dynamic"></asp:RangeValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="txtExpressPrice" class="col-sm-5 control-label">Express Charge</label>
                        <div class="col-sm-5">
                            <asp:TextBox ID="txtExpressPrice" class="form-control express_charge" type="text" placeholder="Price" runat="server" />
                            <asp:RequiredFieldValidator ValidationGroup="grpAddDocumentRow" ID="rfvExpressPrice" runat="server" ControlToValidate="txtExpressPrice" ErrorMessage="Express price cannot be empty." Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ValidationGroup="grpAddDocumentRow" ID="rvExpressPrice" runat="server" ControlToValidate="txtExpressPrice" Type="Integer" MinimumValue="0" MaximumValue="10000" ErrorMessage="Express price cannot be less than 0." Display="Dynamic"></asp:RangeValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="txtWeight" class="col-sm-5 control-label">Weight</label>
                        <div class="col-sm-5">
                            <asp:TextBox ID="txtWeight" class="form-control express_charge" type="text" placeholder="Price" runat="server" />
                            <asp:RequiredFieldValidator ValidationGroup="grpAddDocumentRow" ID="rfvWeight" runat="server" ControlToValidate="txtExpressPrice" ErrorMessage="Express price cannot be empty." Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ValidationGroup="grpAddDocumentRow" ID="rvWeight" runat="server" ControlToValidate="txtExpressPrice" Type="Integer" MinimumValue="0" MaximumValue="10000" ErrorMessage="Express price cannot be less than 0." Display="Dynamic"></asp:RangeValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="txtMaxCopies" class="col-sm-5 control-label">Maximum Copies</label>
                        <div class="col-sm-5">
                            <asp:TextBox ID="txtMaxCopies" class="form-control express_charge" type="text" placeholder="Price" runat="server" />
                            <asp:RequiredFieldValidator ValidationGroup="grpAddDocumentRow" ID="rfvMaxCopies" runat="server" ControlToValidate="txtExpressPrice" ErrorMessage="Express price cannot be empty." Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ValidationGroup="grpAddDocumentRow" ID="rvMaxCopies" runat="server" ControlToValidate="txtExpressPrice" Type="Integer" MinimumValue="0" MaximumValue="10000" ErrorMessage="Express price cannot be less than 0." Display="Dynamic"></asp:RangeValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-5 col-sm-7">
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="cbForUndergraduate" runat="server" CcsClass="checkbox"/>
                                    <asp:Label runat="server" Text="For Undergraduate"></asp:Label>
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="cbForGraduate" runat="server" CcsClass="checkbox"/>
                                    <asp:Label runat="server" Text="For Graduate"></asp:Label>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                <div class="modal-footer">
                    <div class="popup_center_align">
                        <asp:Button ID="btnAdd" Text="Add" CssClass="btn btn-success" OnClick="btnAdd_Click" runat="server" />
                        <button id="btnAddCancel" class="btn btn-warning">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script src="/Script/admin_document_list.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js" type="text/javascript"></script>
</asp:Content>