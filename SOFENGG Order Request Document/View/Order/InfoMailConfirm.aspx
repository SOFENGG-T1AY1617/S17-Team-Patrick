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
        
        <h4 class = "content-header">Mailing Information</h4>
        <table class="table table-bordered table-striped">
            <tr>
                <td>Mailing Address</td>
                <td>78 Taft Street, Manila City</td>
            </tr>
            <tr>
                <td>Delivery Area</td>
                <td>Metro Manila</td>
            </tr>
            <tr>
                <td>Delivery Charge</td>
                <td>PHP 128.00</td>
            </tr>
            <tr>
                <td>Contact Number</td>
                <td>09178287277</td>
            </tr>
            <tr>
                <td colspan="2">
                    <a class="btn btn-default" href="/info_acad_de.html">Edit</a>
                    <a class="btn btn-default" href="/info_acad_de.html">Delete</a>
                </td>
            </tr>
        </table>
        <div>
            <a href="info_mail_de.html" class="btn btn-primary">Add Another Address</a>
            <a href="document_list.html" class="btn btn-primary">Next</a>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>