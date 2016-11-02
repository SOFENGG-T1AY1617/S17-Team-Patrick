<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="PersonalInformation.aspx.cs" Inherits="SOFENGG_Order_Request_Document.PersonalInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Always change the css file name to html file name! -->
    <link rel="stylesheet" href="/Content/css/personal_information.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="col-xs-3">
        <h5>Request Flow</h5>
        <ul>
            <li>
                <b>Personal Information</b>
            </li>
            <li>Academic Information</li>
            <li>Mailing Information</li>
            <li>Document List</li>
            <li>Checkout</li>
        </ul>
        <div class="content-divider"></div>
    </div>
    <div class="col-xs-9">
        <h5 class="content-header">Personal Information</h5>
        <table border=1 class="content-form">
            <tr>
                <td colspan="2" class="content-form_label">Please fill out the form below.</td>
            </tr>
            <tr>
                <td class="content-form_label">Last Name</td>
                <td>&nbsp;<input type="text"></td>
            </tr>
            <tr>
                <td class="content-form_label">First Name</td>
                <td>&nbsp;<input type="text"></td>
            </tr>
            <tr>
                <td class="content-form_label">Middle Name</td>
                <td>&nbsp;<input type="text"></td>
            </tr>
            <tr>
                <td class="content-form_label">Gender</td>
                <td>
                    <form action="">
                        &nbsp;<input type="radio" name="gender">&nbsp;Male
                        &nbsp;<input type="radio" name="gender">&nbsp;Female
                    </form>
                </td>
            </tr>
            <!-- Add date using PHP/ASP here -->
            <tr>
                <td class="content-form_label">Birth date</td>
                <td>
                    &nbsp;
                    <select name="" id="">
                        <option value="">January</option>
                        <option value="">February</option>
                        <option value="">March</option>
                        <option value="">April</option>
                        <option value="">May</option>
                        <option value="">June</option>
                        <option value="">July</option>
                        <option value="">August</option>
                        <option value="">September</option>
                        <option value="">October</option>
                        <option value="">November</option>
                        <option value="">December</option>
                    </select>
                    <select name="" id="day"></select>
                    <select name="" id="year"></select>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">Citizenship</td>
                <td>&nbsp;<input type="text"></td>
            </tr>
            <tr>
                <td class="content-form_label">Current Address</td>
                <td>&nbsp;<textarea name="" id="" cols="30" rows="2"></textarea>&nbsp;</td>
            </tr>
            <tr>
                <td class="content-form_label">Phone Number</td>
                <td>&nbsp;<input type="text"></td>
            </tr>
            <tr>
                <td class="content-form_label">Email Address</td>
                <td>&nbsp;<input type="text"></td>
            </tr>
            <tr>
                <td class="content-form_label">High School Attended</td>
                <td>&nbsp;<input type="text"></td>
            </tr>
            <tr>
                <td class="content-form_label">Place of Birth</td>
                <td>&nbsp;<input type="text"></td>
            </tr>
        </table>
        <a class="btn btn-primary content-form_next" href="/info_acad_de.html">Next</a>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">

    <script src="/Script/personal_information.js"></script>
</asp:Content>