<%@ Page Title="" Language="C#" MasterPageFile="~/Order/Order.Master" AutoEventWireup="true" CodeBehind="InfoAcadDe.aspx.cs" Inherits="SOFENGG_Order_Request_Document.InfoAcadDe" %>
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
        <form name "frmAcadInfo" method="post" action="info_acad_de.html">
            <h5 class="content-header" class="content-form">Academic Information</h5>

            <p>This step allows you to enter your academic information.<br><br/>It is possible that you may have earned more than one degree at DLSU. If your request will cover more than one degree, please make sure you enter the details of these degrees. Otherwise, just enter the details of the degree for which you will be requesting a document.
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
                        <select name="" id="">
                            <option value="Taft">Taft</option>
                            <option value="STC">STC</option>
                            <option value="">Makati</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="content-form_label">Year Admitted</td>
                    <td style="padding-left: 3px;">
                        <select name="" id="year_admitted"></select>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="content-form_label">Level <span style="color: red">*</span></td>
                    <td style="padding-left: 3px;">
                        &nbsp;<input type="radio" name="optLevel" value="0" id="bachelor" checked>&nbsp;Bachelor
                        <br/>
                        &nbsp;<input type="radio" name="optLevel" value="1" id="masters">&nbsp;Masters
                        <br>
                        &nbsp;<input type="radio" name="optLevel" value="2" id="doctorate">&nbsp;Doctorate
                        <br>
                    </td>
                </tr>
                <tr>
                    <td class="content-form_label">Is Graduate? <span style="color: red">*</span></td>
                    <td>
                        &nbsp;<input type="checkbox" name="isGraduate" value="0" id="cbGraduate">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="content-form_label">Degree <span style="color: red">*</span></td>
                    <td>&nbsp;<input type="text" name="txtDegree" maxlength="100" size="40" value></td>
                </tr>
                <tr>
                    <td class="content-form_label">Student No</td>
                    <td>&nbsp;<input type="text" name="txtStudNo" maxlength="12" size="10" value></td>
                </tr>
                <tr>
                    <td class="content-form_label">Admitted as</td>
                    <td>
                        &nbsp;<input type="radio" name="optAdmittedAs" value="R">Regular Student
                        <input type="radio" name="optAdmittedAs" value="T">Transferee
                        <input type="radio" name="optAdmittedAs" value="G">Graduate
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="button" name="butAction" value="Cancel" class="btn btn-primary">
                        <a href="info_acad_confirm.html">
                            <input type="button" value="Submit" class="btn btn-primary">
                        </a>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">

    <script src="Script/info_acad_de.js"></script>
</asp:Content>