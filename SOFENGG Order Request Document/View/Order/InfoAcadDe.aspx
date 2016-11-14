<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="InfoAcadDe.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.InfoAcadDe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Always change the css file name to html file name! -->
    <link rel="stylesheet" href="/Content/css/info_acad_de.css">
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
        <form id="frmAcadInfo" runat="server">
            <h5 class="content-header" class="content-form">Academic Information</h5>

            <p>This step allows you to enter your academic information.<br><br/>
            It is possible that you may have earned more than one degree at DLSU. 
            If your request will cover more than one degree, please make sure you enter the details of these degrees. 
            Otherwise, just enter the details of the degree for which you will be requesting a document.
            </p>

            <table border="1" class="content-form align = 'center'">
                <thead>
                <tr>
                    <td colspan="2">&nbsp;<span style="color: red">*</span> - indicates required field</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="content-form_label">Campus Attended</td>
                    <td style="padding-left: 3px;">
                        <asp:DropDownList ID="ddlCampus" runat="server" Width="200px">
                            <asp:ListItem Text="Select Campus" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Taft" Value="1"></asp:ListItem>
                            <asp:ListItem Text="STC" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Makati" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="content-form_label">Year Admitted</td>
                    <td style="padding-left: 3px;">
                        <asp:DropDownList ID="ddlYearAdmitted" runat="server" Width="200px">
                        </asp:dropdownlist>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="content-form_label">Level <span style="color: red">*</span></td>
                    <td style="padding-left: 3px;">
                        <asp:DropDownList ID="ddlLevel" runat="server" Width="200px">
                            <asp:ListItem Text="Select Level" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Bachelor" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Masters" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Doctorate" Value="3"></asp:ListItem>
                         </asp:DropDownList>
                         <asp:RequiredFieldValidator id="rfvLevel" runat="server"
                            ControlToValidate="ddlLevel"
                            ErrorMessage="Level is a required field."
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="content-form_label">Is Graduate? <span style="color: red">*</span></td>
                    <td>
                        &nbsp;<asp:CheckBox ID="isGraduate" runat="server"/>&nbsp;
                        <asp:RequiredFieldValidator id="rfvGraduate" runat="server"
                        ControlToValidate="isGraduate"
                        ErrorMessage="Please check if you have graduated in the inputted level."
                            ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="content-form_label">Degree <span style="color: red">*</span></td>
                    <td>&nbsp;
                        <asp:TextBox ID="txtDegree" runat="server" style="maxlength:100px; size:40px;"></asp:TextBox>
                        <asp:RequiredFieldValidator id="rfvDegree" runat="server"
                        ControlToValidate="txtDegree"
                        ErrorMessage="Degree is a required field."
                            ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </tr>
                <tr>
                    <td class="content-form_label">Student No</td>
                    <td>&nbsp;
                        <asp:TextBox ID="txtStudNo" runat="server" style="maxlength:12px; size:10px;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="content-form_label">Admitted as</td>
                    <td style="padding-left: 3px">
                        <asp:RadioButtonList ID="optAdmittedAs" runat="server" 
                            RepeatDirection="Vertical" RepeatLayout="Flow">
                            <asp:ListItem Text="Regular Student" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Transferee" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Graduate" Value="3"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="butAction" runat="server" value="Cancel" class="btn btn-primary" Text="Cancel"/>
                        <asp:Button ID="butSubmit" runat="server" value="Submit" class="btn btn-primary" OnClick = "SubmitStudentDegree_Click" Text="Submit"/>

                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">

    <script src="/Script/info_acad_de.js"></script>
</asp:Content>