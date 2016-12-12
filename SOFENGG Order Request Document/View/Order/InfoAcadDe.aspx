﻿<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="InfoAcadDe.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.InfoAcadDe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Always change the css file name to html file name! -->
    <link rel="stylesheet" href="/Content/css/info_acad_de.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
        <div class="container-fluid center-block">
            <ul class="breadcrumb">
                &nbsp;
                <li><a href="#">Home</a></li>
                <li><asp:HyperLink id="hlPersonal" 
                        NavigateUrl="PersonalInformation.aspx" 
                        Text="Personal Information" 
                        runat="server"/></li>
                <li class="active">Academic Information</li>
            </ul>
                <h4 class="content-header">Academic Information</h4>
                    <blockquote>
                        <p>This step allows you to enter your academic information.<br><br>
                        It is possible that you may have earned more than one degree at DLSU. <br>
                        If your request will cover more than one degree, please make sure you enter the details of these degrees. <br>
                        Otherwise, just enter the details of the degree for which you will be requesting a document.
                        </p>
                    </blockquote>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <td colspan="2"><span style="color: red">*</span> - indicates required field</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="content-form_label">Campus Attended</td>
                        <td>
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
                        <td>
                            <asp:DropDownList ID="ddlYearAdmitted" runat="server" Width="200px"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="content-form_label">Degree <span style="color: red">*</span></td>
                        <td>
                            <asp:DropDownList ID="ddlDegree" runat="server" Width="400px"></asp:DropDownList>
                            <asp:RequiredFieldValidator id="rfvDegree" runat="server"
                                ControlToValidate="ddlDegree"
                                ErrorMessage="Degree is a required field."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="content-form_label">Student No.</td>
                        <td>
                            <asp:TextBox ID="txtStudNo"
                                    runat="server" style="maxlength:12px; size:10px;"></asp:TextBox>
                            <div id="txtStudNo" class="alert alert-dismissible alert-danger" style="display: none;">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <strong>Oh my goodness!</strong> Student number must only contain 8 numbers.
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="content-form_label">Admitted as</td>
                        <td>
                            <asp:RadioButtonList ID="optAdmittedAs" runat="server" 
                                RepeatDirection="Vertical" RepeatLayout="Flow">
                                <asp:ListItem Text="Regular Student" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Transferee" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Graduate" Value="3"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    </tbody>
                </table>
			 <ul class="pager">
            <li class="previous disabled"><a href="PersonalInformation.aspx" id="btnAction">&larr; Previous</a></li>
            <li class="next"><asp:HyperLink text="Next &rarr;" id="btnSubmit" runat="server" OnClick="SubmitStudentDegree_Click"></asp:HyperLink></li>
        </ul>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">

    <script src="/Script/info_acad_de.js"></script>
</asp:Content>