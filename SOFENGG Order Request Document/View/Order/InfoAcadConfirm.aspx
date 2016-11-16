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
                <asp:HyperLink id="hlPersonal" 
                    NavigateUrl="personal_information.html" 
                    Text="Personal Information" 
                    runat="server"/>
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
        
        <asp:Repeater id="rptInfoAcadConfirm" runat="server">
            <HeaderTemplate>
                <table class="table table-bordered table-striped">
            </HeaderTemplate>

            <ItemTemplate>
                <table class="table table-bordered table-striped" runat="server">
                    <tr>
                        <td>ID Number</td>
                        <td><asp:Label runat="server" ID="lblIdNumber" Text=<%# Eval("IdStudent")%>/></td>
                    </tr>
                    <tr>
                        <td>Level</td>
                        <td><asp:Label runat="server" ID="lblLevel" Text=<%# Eval("Degree.Level")%>/></td>
                    </tr>
                    <tr>
                        <td>Degree</td>
                        <td><asp:Label runat="server" ID="lblDegree" Text=<%# Eval("Degree.Name")%>/></td>
                    </tr>
                    <tr>
                        <td>Graduate</td>
                        <td><asp:Label runat="server" ID="lblGraduate" Text="True"/></td>
                    </tr>
                    <tr>
                        <td>Admitted as</td>
                        <td><asp:Label runat="server" ID="lblAdmittedAs" Text=<%# Eval("AdmittedAs")%>/></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:HiddenField id="updateBtns" runat="server" Value='<%# Eval("Degree.Id")%>' />
                            <asp:Button class="btn btn-default" runat="server" text="Edit" OnClick="EditStudentDegree"/>
                            <asp:Button class="btn btn-default" runat="server" text="Delete" OnClick="DeleteStudentDegree"/>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>

            <FooterTemplate>
            </FooterTemplate>

       </asp:Repeater>
       
        <div>
            <asp:Button class="btn btn-primary" runat="server"  Text="Add Another Degree" OnClick="AddStudentDegree"/>
            <asp:Button class="btn btn-primary" runat="server"  Text="Next" OnClick="GoToInfoMailDe"/>
        </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>