<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="DocumentList.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.DocumentList" %>
<%@ Import Namespace="System.ComponentModel" %>
<%@ Import Namespace="SOFENGG_Order_Request_Document.Model" %>
<%@ Import Namespace="SOFENGG_Order_Request_Document.Model.Helper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Always change the css file name to html file name! -->
    <link rel="stylesheet" href="/Content/css/document_list.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    
<div class="container-fluid center-block"> 
    <ul class="breadcrumb">
                &nbsp;
                <li><a href="#">Home</a></li>
                <li><asp:HyperLink id="hlPersonal" 
                        NavigateUrl="personal_information.html" 
                        Text="Personal Information" 
                        runat="server"/></li>
                <li><asp:HyperLink id="HyperLink1" 
                                NavigateUrl="info_acad.de.html" 
                                Text="Academic Information" 
                                runat="server"/></li>
                <li><asp:HyperLink id="HyperLink2" 
                                        NavigateUrl="info_mail_de.html" 
                                        Text="Mailing Information" 
                                        runat="server"/></li>
                <li class="active">Document List</li>
     </ul>
    
    

        <form runat="server">
        <h4 class="content-header">Document List</h4>
        <div>
            <blockquote>
                    <p>Below is a list of documents that you can request from the OUR. <br />Press the order link to the document you want to order.</p>
            </blockquote>
           
            <table class="table table-striped" >
                <tr>
                    <td colspan="4" class="content-document-header" >Transcript of Records</td>
                </tr>
            </table>
            <asp:GridView ID="gvTOR" AutoGenerateColumns="False" runat="server" CssClass="table table-striped" >
                <Columns >
                    <asp:TemplateField HeaderText="Document" HeaderStyle-Width="175px" >
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Name") %>' ID="lbName"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Regular Price" HeaderStyle-Width="175px" >
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("RegularPrice") %>'  ID="lbRegularPrice"></asp:Label>  
                            </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Express Price" HeaderStyle-Width="175px" >
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("ExpressPrice") %>' ID="lbExpressPrice"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                    <asp:HyperLinkField Text="Order" navigateurl="~\details.aspx" HeaderStyle-Width="175px" />
                </Columns>
            </asp:GridView>
            <table class="table table-striped">
                <tr>
                    <td colspan="4" class="content-document-header">Certification</td>
                </tr>
            </table>
            <asp:GridView ID="gvCertification" AutoGenerateColumns="False" runat="server" CssClass="table table-striped">
                <Columns >
                    <asp:TemplateField HeaderText="Document" HeaderStyle-Width="175px">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Name") %>' ID="lbName"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Regular Price" HeaderStyle-Width="175px">
                        <ItemTemplate >
                            <asp:Label runat="server" Text='<%# Bind("RegularPrice") %>' ID="lbRegularPrice"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Express Price" HeaderStyle-Width="175px">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("ExpressPrice") %>' ID="lbExpressPrice"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                 
                    <asp:HyperLinkField Text="Order" navigateurl="~\details.aspx" HeaderStyle-Width="175px" />
                   
                </Columns>
            </asp:GridView>

            <table class="table table-striped">
                <tr>
                    <td colspan="4" class="content-document-header">Certified True Copy</td>
                </tr>
            </table>

            <asp:GridView ID="gvTrueCopy" AutoGenerateColumns="False" runat="server" CssClass="table table-striped">
                <Columns >
                    <asp:TemplateField HeaderText="Document" HeaderStyle-Width="175px">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Name") %>' ID="lbName"  ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Regular Price"  HeaderStyle-Width="175px">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("RegularPrice") %>' ID="lbRegularPrice"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Express Price"  HeaderStyle-Width="175px">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("ExpressPrice") %>' ID="lbExpressPrice"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                    <asp:HyperLinkField Text="Order" navigateurl="~\details.aspx"  HeaderStyle-Width="175px" />
                </Columns>
            </asp:GridView>

            <table class="table table-striped">
                <tr>
                    <td colspan="4" class="content-document-header">Others</td>
                </tr>
            </table>

            <asp:GridView ID="gvOthers" AutoGenerateColumns="False" runat="server" CssClass="table table-striped">
                <Columns >
                    <asp:TemplateField HeaderText="Document Name" HeaderStyle-Width="175px">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Name") %>' ID="lbName"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Regular Price" HeaderStyle-Width="175px">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("RegularPrice") %>' ID="lbRegularPrice"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Express Price" HeaderStyle-Width="175px">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("ExpressPrice") %>' ID="lbExpressPrice"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                    <asp:HyperLinkField Text="Order" navigateurl="~\details.aspx"  HeaderStyle-Width="175px" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>