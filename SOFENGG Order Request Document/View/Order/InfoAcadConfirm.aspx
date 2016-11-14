<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="InfoAcadConfirm.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.InfoAcadConfirm" %>
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
        <form runat="server">
        <h5>Academic Information</h5>
        <asp:Panel ID="pnlStudentDegree" runat="server">
            
            <asp:gridview id="table1" runat="server"></asp:gridview>

            <!--
            <table id="sd1" class="table table-bordered table-striped" runat="server">
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
                        <asp:Button class="btn btn-default" Text="Edit" OnClick=""/>
                        <asp:Button class="btn btn-default" Text="Delete" OnClick=""/>
                    </td>
                </tr>
            </table>
                -->
        </asp:Panel>
        <div>
            <asp:Button class="btn btn-primary" Text="Add Another Degree" href="/View/Order/InfoAcadDe.aspx"/>
            <asp:Button class="btn btn-primary" Text="Next" OnClick="GoToInfoMailDe"/>
        </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>