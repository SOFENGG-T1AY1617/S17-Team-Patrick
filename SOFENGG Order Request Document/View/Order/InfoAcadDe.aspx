<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="InfoAcadDe.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.InfoAcadDe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Always change the css file name to html file name! -->
    <link rel="stylesheet" href="/Content/css/info_acad_de.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
    <div class="container-fluid center-block" style="width: 800px;">
        <ul class="breadcrumb">
            &nbsp;
                <li><a href="#">Home</a></li>
            <li>
                <asp:HyperLink ID="hlPersonal"
                    NavigateUrl="PersonalInformation.aspx"
                    Text="Personal Information"
                    runat="server" /></li>
            <li class="active">Academic Information</li>
        </ul>
        <h4 class="content-header">Academic Information</h4>
        <blockquote>
            <p>
                This step allows you to enter your academic information.<br>
                <br>
                It is possible that you may have earned more than one degree at DLSU.
                <br>
                If your request will cover more than one degree, please make sure you enter the details of these degrees.
                <br>
                Otherwise, just enter the details of the degree for which you will be requesting a document.
            </p>
        </blockquote>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <td colspan="2"><span style="color: red">*</span> - indicates required field</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="content-form_label">Campus Attended</td>
                    <td>
                        <asp:UpdatePanel ID="upCampus" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlCampus" runat="server" AutoPostBack="true" Width="200px" OnTextChanged="DDLCampus_SelectedIndexChanged">
                                    <asp:ListItem Text="Select Campus" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Taft" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="STC" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Makati" Value="3"></asp:ListItem>
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
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
                        <asp:UpdatePanel ID="upDegree" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlDegree" runat="server" Width="400px"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvDegree" runat="server"
                                    ControlToValidate="ddlDegree"
                                    ErrorMessage="Degree is a required field."
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td class="content-form_label">Student No.</td>
                    <td>
                        <asp:TextBox ID="txtStudNo" CssClass="form-control"
                            runat="server" Style="size: 10px;"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ID="rexStudNo"
                            ControlToValidate="txtStudNo" ValidationExpression="^[0-9]{7,8}$" ErrorMessage="Please enter a student number." />
                        <asp:RequiredFieldValidator ID="rfvStudNo" runat="server"
                            ControlToValidate="txtStudNo"
                            ErrorMessage="Student No. is a required field."
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="content-form_label">Admitted as</td>
                    <td>
                        <div class="checkbox checkboxlist col-sm-12">
                            <asp:RadioButtonList ID="optAdmittedAs" runat="server"
                                RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem class="radio-inline" Text="Regular Student" Value="1"></asp:ListItem>
                                <asp:ListItem class="radio-inline" Text="Transferee" Value="2"></asp:ListItem>
                                <asp:ListItem class="radio-inline" Text="Graduate" Value="3"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <ul class="pager">
            <li class="previous disabled"><a href="PersonalInformation.aspx" id="btnAction">&larr; Previous</a></li>
            <li class="next">
                <asp:LinkButton Text="Next &rarr;" ID="btnSubmitStudentDegree" runat="server" OnClick="SubmitStudentDegree_Click"></asp:LinkButton></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">

    <script src="/Script/info_acad_de.js"></script>
</asp:Content>