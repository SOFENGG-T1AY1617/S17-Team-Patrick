<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="DocumentList.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.DocumentList" %>

<%@ Import Namespace="System.ComponentModel" %>
<%@ Import Namespace="SOFENGG_Order_Request_Document.Model" %>
<%@ Import Namespace="SOFENGG_Order_Request_Document.Model.Helper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Always change the css file name to html file name! -->
    <link rel="stylesheet" href="/Content/css/document_list.css" />
    <style type="text/css">
        .hiddencol {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="container-fluid center-block">
        <ul class="breadcrumb">
            &nbsp;
                <li><a href="#">Home</a></li>
            <li>
                <a href="PersonalInformation.aspx">Personal Information</a>
            </li>
            <li>
                <a href="InfoAcadDe.aspx">Academic Information</a>
            </li>
            <li>
                <a href="InfoMailDe.aspx">Mailing Information</a>
            </li>
            <li class="active">Document List</li>
        </ul>

        <form runat="server">
            <h4 class="content-header">Document List</h4>
            <div>
                <blockquote>
                    <p>
                        Below is a list of documents that you can request from the OUR.
                        <br />
                        Press the order link to the document you want to order.
                    </p>
                </blockquote>
                <div>
                    <asp:Repeater ID="repDocumentList" runat="server">
                        <ItemTemplate>
                            <table class="table table-striped" style="width: 571px; margin-left: auto; margin-right: auto;">
                                <tr>
                                    <td colspan="4" class="content-document-header"><%# Eval("Category") %></td>
                                </tr>
                            </table>
                            <asp:GridView ID="gvList" DataSource='<%# Eval("DocumentList") %>' AutoGenerateColumns="False" runat="server" CssClass="table table-striped" Style="width: 0px; margin-left: auto; margin-right: auto;">
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="Header" HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol"></asp:BoundField>
                                    <asp:TemplateField HeaderText="Document" HeaderStyle-Width="250px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Name") %>' ID="lbName"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Regular Price" HeaderStyle-Width="120px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# float.Parse(Eval("RegularPrice").ToString()) == 0f ? "N/A" : float.Parse(Eval("RegularPrice").ToString()).ToString("n2") %>' ID="lbRegularPrice"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Express Price" HeaderStyle-Width="120px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# float.Parse(Eval("ExpressPrice").ToString()) == 0f ? "N/A" : float.Parse(Eval("ExpressPrice").ToString()).ToString("n2") %>' ID="lbExpressPrice"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="btnOrder" runat="server" CssClass="btn btn-primary" Text="Button" OnClick="btnOrder_OnClick"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>