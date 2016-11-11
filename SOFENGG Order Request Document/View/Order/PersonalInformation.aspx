<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="PersonalInformation.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.PersonalInformation" %>
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
                <td>&nbsp;<asp:TextBox ID="txtLName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="content-form_label">First Name</td>
                <td>&nbsp;<asp:TextBox ID="txtFName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="content-form_label">Middle Name</td>
                <td>&nbsp;<asp:TextBox ID="txtMName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="content-form_label">Gender</td>
                <td>
                    <asp:RadioButtonList ID="optGender" runat="server" 
                            RepeatDirection="Vertical" RepeatLayout="Table">
                            <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <!-- Add date using PHP/ASP here -->
            <tr>
                <td class="content-form_label">Birth date</td>
                <td>
                    &nbsp;
                    <asp:DropDownList ID="ddlBirthMonth" runat="server" Width="200px">
                        <asp:ListItem Text="Select Month" Value="0"></asp:ListItem>
                        <asp:ListItem Text="January" Value="1"></asp:ListItem>
                        <asp:ListItem Text="February" Value="2"></asp:ListItem>
                        <asp:ListItem Text="March" Value="3"></asp:ListItem>
                        <asp:ListItem Text="April" Value="4"></asp:ListItem>
                        <asp:ListItem Text="May" Value="5"></asp:ListItem>
                        <asp:ListItem Text="June" Value="6"></asp:ListItem>
                        <asp:ListItem Text="July" Value="7"></asp:ListItem>
                        <asp:ListItem Text="August" Value="8"></asp:ListItem>
                        <asp:ListItem Text="September" Value="9"></asp:ListItem>
                        <asp:ListItem Text="October" Value="10"></asp:ListItem>
                        <asp:ListItem Text="November" Value="11"></asp:ListItem>
                        <asp:ListItem Text="December" Value="12"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlBirthDay" runat="server" Width="200px">
                    </asp:dropdownlist>
                    <asp:DropDownList ID="ddlBirthYear" runat="server" Width="200px">
                    </asp:dropdownlist>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">Citizenship</td>
                <td>&nbsp;<asp:TextBox ID="txtCitizen" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="content-form_label">Current Address</td>
                <td>&nbsp;<asp:TextBox ID="txtCurrentAddress" runat="server" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="content-form_label">Phone Number</td>
                <td>&nbsp;<asp:TextBox ID="txtPhoneNum" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="content-form_label">Email Address</td>
                <td>&nbsp;<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="content-form_label">High School Attended</td>
                <td>&nbsp;<asp:TextBox ID="txtHSAttended" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="content-form_label">Place of Birth</td>
                <td>&nbsp;<asp:TextBox ID="txtBirthplace" runat="server"></asp:TextBox></td>
            </tr>
        </table>
        <a class="btn btn-primary content-form_next" runat="server" href="/info_acad_de.html">Next</a>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">

    <script src="/Script/personal_information.js"></script>
</asp:Content>
