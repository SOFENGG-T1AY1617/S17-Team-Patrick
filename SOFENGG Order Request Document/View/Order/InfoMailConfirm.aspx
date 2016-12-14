<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="InfoMailConfirm.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.InfoMailConfirm" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Always change the css file name to html file name! -->
    <link rel="stylesheet" href="/Content/css/info___confirm.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container-fluid center-block" style="width:800px;">
       <ul class="breadcrumb">
                &nbsp;
                <li><a href="#">Home</a></li>
                <li><asp:HyperLink ID="hlPersonal" 
                        NavigateUrl="PersonalInformaton.aspx" 
                        Text="Personal Information" 
                        runat="server"/>
                </li>
                <li>
                <asp:HyperLink ID="hlAacademic" 
                    NavigateUrl="InfoAcadDe.aspx" 
                    Text="Academic Information" 
                    runat="server"/>
                </li>
                <li class="active">Mailing Information</li>
        </ul>
        
        <h4 class = "content-header">Mailing Information</h4>
         <asp:Repeater id="rptInfoMailConfirm" runat="server">
            <HeaderTemplate>
            </HeaderTemplate>

            <ItemTemplate>
                <table class="table table-bordered table-striped">
                <tr>
                    <td>Mailing Address</td>
                    <td><asp:Label runat="server" ID="lblMailingAddress" Text=<%# Eval("MailingAddress")%>/></td></td>
                </tr>
                <tr>
                    <td>Delivery Area</td>
                    <td><asp:Label runat="server" ID="lblIdNumber" Text=<%# Eval("DeliveryArea.Name")%>/></td>
                </tr>
                <tr>
                    <td>Delivery Charge</td>
                    <td><asp:Label runat="server" ID="Label1" Text=<%# Eval("DeliveryArea.Price")%>/></td>
                </tr>
                <tr>
                    <td>Contact Number</td>
                    <td><asp:Label runat="server" ID="Label2" Text=<%# Eval("ContactNo")%>/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:HiddenField id="updateBtns" runat="server" Value='<%# Eval("Id")%>' />
                        <asp:Button class="btn btn-default" runat="server" text="Edit" OnClick="EditMailingInfo"/>
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
							            <asp:Button class="btn btn-default" runat="server" text="Proceed" OnClick="DeleteMailingInfo"/>
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
            <asp:Button runat="server" Text="Add Another Address" class="btn btn-primary" OnClick="AddMailingInfo"/>
            <asp:Button runat="server" Text="Next" class="btn btn-primary" OnClick="GoToDocumentList"/>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>