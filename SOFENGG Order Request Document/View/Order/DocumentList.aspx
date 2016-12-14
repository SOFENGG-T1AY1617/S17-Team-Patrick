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
    
    

        
        <h4 class="content-header">Document List</h4>
        <div>
            <blockquote>
                    <p>Below is a list of documents that you can request from the OUR. <br />Press the order link to the document you want to order.</p>
            </blockquote>
           <div>
            <table class="table table-striped" style="width: 571px; margin-left:auto; margin-right:auto;" >
                <tr>
                    <td colspan="4" class="content-document-header" >Transcript of Records</td>
                </tr>
            </table>
            <asp:GridView ID="gvTOR" AutoGenerateColumns="False" runat="server" CssClass="table table-striped" style=" width:0px; margin-left:auto; margin-right:auto;" 
                OnSelectedIndexChanged="OnSelectedIndexChangedTOR">
                <Columns >
                    <asp:TemplateField HeaderText="Document" HeaderStyle-Width="250px" >
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Name") %>' ID="lbName"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Regular Price" HeaderStyle-Width="120px" >
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("RegularPrice") %>'  ID="lbRegularPrice"></asp:Label>  
                            </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Express Price" HeaderStyle-Width="120px" >
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("ExpressPrice") %>' ID="lbExpressPrice"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                            <asp:ButtonField ButtonType="Button"  CommandName="Select"
                            Text="Order" ControlStyle-CssClass="btn btn-primary" />

                </Columns>
            </asp:GridView>
            <table class="table table-striped" style="width: 571px; margin-left:auto; margin-right:auto;">
                <tr>
                    <td colspan="4" class="content-document-header">Certification</td>
                </tr>
            </table>
            <asp:GridView ID="gvCertification" AutoGenerateColumns="False" runat="server" CssClass="table table-striped" style=" width:0px; margin-left:auto; margin-right:auto;"
                OnSelectedIndexChanged="OnSelectedIndexChangedCert">
                <Columns >
                    <asp:TemplateField HeaderText="Document" HeaderStyle-Width="250px">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Name") %>' ID="lbName"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Regular Price" HeaderStyle-Width="120px">
                        <ItemTemplate >
                            <asp:Label runat="server" Text='<%# Bind("RegularPrice") %>' ID="lbRegularPrice"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Express Price" HeaderStyle-Width="120px">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("ExpressPrice") %>' ID="lbExpressPrice"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                            <asp:ButtonField ButtonType="Button"  CommandName="Select"
                            Text="Order" ControlStyle-CssClass="btn btn-primary" />
                </Columns>
            </asp:GridView>

            <table class="table table-striped" style="width: 571px; margin-left:auto; margin-right:auto;">
                <tr>
                    <td colspan="4" class="content-document-header">Certified True Copy</td>
                </tr>
            </table>

            <asp:GridView ID="gvTrueCopy" AutoGenerateColumns="False" runat="server" CssClass="table table-striped" style=" width:0px; margin-left:auto; margin-right:auto;"
                OnSelectedIndexChanged="OnSelectedIndexChangedTrueCopy">
                <Columns >
                    <asp:TemplateField HeaderText="Document" HeaderStyle-Width="250px">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Name") %>' ID="lbName"  ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Regular Price"  HeaderStyle-Width="120px">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("RegularPrice") %>' ID="lbRegularPrice"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Express Price"  HeaderStyle-Width="120px">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("ExpressPrice") %>' ID="lbExpressPrice"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                            <asp:ButtonField ButtonType="Button"  CommandName="Select"
                            Text="Order" ControlStyle-CssClass="btn btn-primary" />

                                     
                </Columns>
            </asp:GridView>

            <table class="table table-striped" style="width: 571px; margin-left:auto; margin-right:auto;">
                <tr>
                    <td colspan="4" class="content-document-header">Others</td>
                </tr>
            </table>

            <asp:GridView ID="gvOthers" AutoGenerateColumns="False" runat="server" CssClass="table table-striped" style=" width:0px; margin-left:auto; margin-right:auto;"
                 OnSelectedIndexChanged="OnSelectedIndexChangedOthers">

                <Columns >
                    <asp:TemplateField HeaderText="Document Name" HeaderStyle-Width="250px">
                        <ItemTemplate>
                            <asp:Label runat="server"  Text='<%# Bind("Name") %>' ID="lbName"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Regular Price" HeaderStyle-Width="120px">
                        <ItemTemplate>
                            <asp:Label runat="server"  Text='<%# Bind("RegularPrice") %>' ID="lbRegularPrice"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Express Price" HeaderStyle-Width="120px">
                        <ItemTemplate>
                            <asp:Label runat="server"  Text='<%# Bind("ExpressPrice") %>' ID="lbExpressPrice"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField> 
                        <asp:ButtonField ButtonType="Button"  CommandName="Select"
                        Text="Order" ControlStyle-CssClass="btn btn-primary" />
  
                </Columns>
            </asp:GridView>
               </div>
        </div>
   
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>