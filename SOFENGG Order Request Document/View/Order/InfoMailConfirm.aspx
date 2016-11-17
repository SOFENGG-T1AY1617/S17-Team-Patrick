<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="InfoMailConfirm.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.InfoMailConfirm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Always change the css file name to html file name! -->
    <link rel="stylesheet" href="/Content/css/info_*_confirm.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container-fluid center-block">
       <ul class="breadcrumb">
                &nbsp;
                <li><a href="#">Home</a></li>
                <li><asp:HyperLink id="hlPersonal" 
                        NavigateUrl="personal_information.html" 
                        Text="Personal Information" 
                        runat="server"/>
                </li>
                <li>
                <asp:HyperLink id="hlAacademic" 
                    NavigateUrl="info_acad_de.html" 
                    Text="Academic Information" 
                    runat="server"/>
                </li>
                <li class="active">Mailing Information</li>
        </ul>
        <div class="content-divider"></div>
    </div>
    <div class="col-xs-9">
        <h5>Mailing Information</h5>
        
        <asp:Repeater id="rptInfoMailConfirm" runat="server">
            <HeaderTemplate>
            </HeaderTemplate>

            <ItemTemplate>
                <table class="table table-bordered table-striped">
                <tr>
                    <td>Mailing Address</td>
                    <td><asp:Label runat="server" ID="lblMailingAddress" Text=<%# Eval("MailingAddress")%>/></td></td>
                </tr>
                <tr>
                    <td>Delivery Area</td>
                    <td><asp:Label runat="server" ID="lblIdNumber" Text=<%# Eval("DeliveryArea.Name")%>/></td>
                </tr>
                <tr>
                    <td>Delivery Charge</td>
                    <td><asp:Label runat="server" ID="Label1" Text=<%# Eval("DeliveryArea.Price")%>/></td>
                </tr>
                <tr>
                    <td>Contact Number</td>
                    <td><asp:Label runat="server" ID="Label2" Text=<%# Eval("ContactNo")%>/></td>
                </tr>
                <tr>
                    <td colspan="2">
                         <asp:HiddenField id="updateBtns" runat="server" Value='<%# Eval("Id")%>' />
                            <asp:Button class="btn btn-default" runat="server" text="Edit" OnClick="EditMailingInfo"/>
                            <asp:Button class="btn btn-default" runat="server" text="Delete" OnClick="DeleteMailingInfo"/>
                    </td>
                </tr>
                </table>
            </ItemTemplate>

            <FooterTemplate>
            </FooterTemplate>

       </asp:Repeater>
        <div>
            <asp:Button runat="server" Text="Add Another Address" class="btn btn-primary" OnClick="AddMailingInfo"/>
            <asp:Button runat="server" Text="Next" class="btn btn-primary" OnClick="GoToDocumentList"/>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>