<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="InfoAcadConfirm.aspx.cs" Inherits="SOFENGG_Order_Request_Document.InfoAcadConfirm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Always change the css file name to html file name! -->
    <link rel="stylesheet" href="/Content/css/info_*_confirm.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="col-xs-3">
        <h5>Request Flow</h5>
        <ul>
            <li>
                <a href="personal_information.html">Personal Information</a>
            </li>
            <li>
                <b>Academic Information</b>
            </li>
            <li>Mailing Information</li>
            <li>Document List</li>
            <li>Checkout</li>
        </ul>
        <div class="content-divider"></div>
    </div>
    <div class="col-xs-9">
        <h5>Academic Information</h5>
        <table class="table table-bordered table-striped">
            <tr>
                <td>Level</td>
                <td>Bachelor </td>
            </tr>
            <tr>
                <td>Degree</td>
                <td>BS Computer Science</td>
            </tr>
            <tr>
                <td>Graduate</td>
                <td>No</td>
            </tr>
            <tr>
                <td>Year Level</td>
                <td>3rd Year</td>
            </tr>
            <tr>
                <td>Admitted as</td>
                <td>Regular Student</td>
            </tr>
            <tr>
                <td colspan="2">
                    <a class="btn btn-default" href="/info_acad_de.html">Edit</a>
                    <a class="btn btn-default" href="/info_acad_de.html">Delete</a>
                </td>
            </tr>
        </table>
        <div>
            <a href="info_acad_de.html" class="btn btn-primary">Add Another Degree</a>
            <a href="info_mail_de.html" class="btn btn-primary">Next</a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>