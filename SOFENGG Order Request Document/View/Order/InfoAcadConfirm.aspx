<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="InfoAcadConfirm.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.InfoAcadConfirm" EnableEventValidation="false" %>
<%@ Import Namespace="SOFENGG_Order_Request_Document.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Always change the css file name to html file name! -->
    <link href="../../Content/css/info___confirm.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container-fluid center-block" style="width:800px;">
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
                        <td>Degree</td>
                        <td><asp:Label runat="server" ID="lblDegree" Text=<%# Eval("Degree.Name")%>/></td>
                    </tr>
                    <tr>
                        <td>Admitted as</td>
                        <td><asp:Label runat="server" ID="lblAdmittedAs" Text=<%# Eval("AdmittedAs")%>/></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:HiddenField id="updateBtns" runat="server" Value='<%# Eval("Id")%>' />
                            <asp:Button class="btn btn-default" runat="server" text="Edit" OnClick="EditStudentDegree"/>
							<a href="#myModal" class="btn btn-default" data-toggle="modal">Delete</a>
                            
                            <div id="myModal" class="modal fade">
		                        <div class="modal-dialog">
		                            <div class="modal-content">
		                                <div class="modal-header">
		                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                                    <h4 class="modal-title">Confirmation</h4>
		                                </div>
		                                <div class="modal-body">
		                                    <p>Are you sure you want to proceed with this action?</p>
		                                    <p class="text-warning"><small>If you proceed, your changes will be lost.</small></p>
		                                </div>
		                                <div class="modal-footer">
		                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						                    <asp:Button class="btn btn-default" runat="server" text="Proceed" OnClick="DeleteStudentDegree"/>
		                                </div>
		                            </div>
		                        </div>
	                        </div>
                            
                            

						</td>
                    </tr>
                </table>
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>

       </asp:Repeater>
        
        
       
        <div class="next_buttons">
            <asp:Button class="btn btn-primary" runat="server"  Text="Add Another Degree" OnClick="AddStudentDegree"/>
            <asp:Button class="btn btn-primary" runat="server"  Text="Next" OnClick="GoToInfoMailDe"/>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>