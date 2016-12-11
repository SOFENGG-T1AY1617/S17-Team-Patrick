<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="PersonalInformation.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.PersonalInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Always change the css file name to html file name! -->
    <link rel="stylesheet" href="/Content/css/personal_information.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
<div class = "container-fluid center-block">
    <div class="row">
        <div class="btn-group btn-breadcrumb">
            &nbsp;
            <a href="#" class="btn btn-default"><i class="glyphicon glyphicon-home"></i></a></li>
            <a class="btn btn-default active">Personal Information</a>
        </div>
    </div>
        <form runat="server">
        <h4 class="content-header">Personal Information</h4>
        <table class="table table-striped">
            <tr>
                <td colspan="2" class="content-form_label">Please fill out the form below.</td>
            </tr>
            <tr>
                <td class="content-form_label">Last Name</td>
                <td>
                    <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator id="rfvLName" runat="server"
                        ControlToValidate="txtLName"
                        ErrorMessage="Last name is a required field."
                            ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">First Name</td>
                <td>
                    <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator id="rfvFName" runat="server"
                        ControlToValidate="txtFName"
                        ErrorMessage="First name is a required field."
                            ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">Middle Name</td>
                <td>
                    <asp:TextBox ID="txtMName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator id="rfvMName" runat="server"
                        ControlToValidate="txtMName"
                        ErrorMessage="Middle name is a required field."
                            ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">Gender</td>
                <td>
                    <asp:RadioButtonList ID="optGender" runat="server" 
                            RepeatDirection="Vertical" RepeatLayout="Flow">
                            <asp:ListItem Text="Male" Value="M"  style="padding: 7px;"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="F"  style="padding: 7px;"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator id="rfvGender" runat="server"
                        ControlToValidate="optGender"
                        ErrorMessage="Gender is a required field."
                            ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <!-- Add date using PHP/ASP here -->
            <tr>
                <td class="content-form_label">Birth Date</td>
                <td>
                    <asp:DropDownList ID="ddlBirthYear" runat="server" Width="80px" onchange = "PopulateDays()" />
                    <asp:DropDownList ID="ddlBirthMonth" runat="server" Width="100px" onchange = "PopulateDays()" />
                    <asp:DropDownList ID="ddlBirthDay" runat="server" Width="50px" />
                
                    <asp:RequiredFieldValidator id="rfvBirthYear" runat="server"
                        ControlToValidate="ddlBirthYear"
                        ErrorMessage="Birthyear is a required field."
                            ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator id="rfvBirthMonth" runat="server"
                        ControlToValidate="ddlBirthMonth"
                        ErrorMessage="Birthmonth is a required field."
                            ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator id="rfvBirthDay" runat="server"
                        ControlToValidate="ddlBirthDay"
                        ErrorMessage="Birthday is a required field."
                            ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">Citizenship</td>
                <td>
                    <asp:TextBox ID="txtCitizen" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator id="rfvCitizen" runat="server"
                        ControlToValidate="txtCitizen"
                        ErrorMessage="Citizenship is a required field."
                            ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">Current Address</td>
                <td>
                    <asp:TextBox ID="txtCurrentAddress" runat="server" 
                        TextMode="MultiLine"  Columns="40" Rows="5"></asp:TextBox>
                    <asp:RequiredFieldValidator id="rfvCurrentAddress" runat="server"
                        ControlToValidate="txtCurrentAddress"
                        ErrorMessage="Entering your current address is required."
                            ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">Phone Number</td>
                <td>
                    <asp:TextBox ID="txtPhoneNum" runat="server"></asp:TextBox>
                    <div id="txtPhoneNum" class="alert alert-dismissible alert-danger" style="display: none;">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <strong>Oh my goodness!</strong> Phone number must only contain numbers.
                    </div>
                    <asp:RequiredFieldValidator id="rfvPhoneNum" runat="server"
                        ControlToValidate="txtPhoneNum"
                        ErrorMessage="Phone number is a required field."
                            ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">Email Address</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    <div id="txtEmail" class="alert alert-dismissible alert-danger" style="display: none;">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <strong>Oh my goodness!</strong> Email address must follow this format: "example@example.com".
                    </div>
                    <asp:RequiredFieldValidator id="rfvEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="E-mail address is a required field."
                            ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">High School Attended</td>
                <td>
                    <asp:TextBox ID="txtHSAttended" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator id="rfvHSAttended" runat="server"
                        ControlToValidate="txtHSAttended"
                        ErrorMessage="High school attended is a required field."
                            ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">Place of Birth</td>
                <td>
                    <asp:TextBox ID="txtBirthplace" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator id="rfvBirthplace" runat="server"
                        ControlToValidate="txtBirthplace"
                        ErrorMessage="birthplace is a required field."
                            ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button class="btn btn-primary" 
                        text="Next" runat="server" OnClick="SubmitPersonalInformation_Click"/>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="/Script/personal_information.js"></script>
    <script src="/Script/Day.js"></script>
</asp:Content>
