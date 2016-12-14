<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="InfoTransaction.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.InfoTransaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Always change the css file name to html file name! -->
    <link rel="stylesheet" href="/Content/css/info_transaction.css">
    <style type="text/css">
        .auto-style1 {
            width: 30%;
            padding-left: 1%;
            height: 19px;
        }
        .auto-style2 {
            height: 19px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
<div class="container-fluid center-block">      
    <li><a href="#">Home</a></li>
                <li><asp:HyperLink id="hlPersonal" 
                        NavigateUrl="personal_information.html" 
                        Text="Personal Information" 
                        runat="server"/></li>
                <li><asp:HyperLink id="HyperLink1" 
                                NavigateUrl="info_acad.de.html" 
                                Text="Academic Information" 
                                runat="server"/></li>
                <li><asp:HyperLink id="HyperLink2" 
                                        NavigateUrl="info_mail_de.html" 
                                        Text="Mailing Information" 
                                        runat="server"/></li>
                <li><asp:HyperLink id="HyperLink3" 
                                        NavigateUrl="document_list.html" 
                                        Text="Document List" 
                                        runat="server"/></li>
                <li class="active">Transaction Details</li>
         </ul>
       
        
            <h5 class="content-header" >Transaction Information</h5>
        
            <asp:Repeater ID="rptPersonalInformation" runat="server">
                <ItemTemplate>
                    <table class="table table-striped">
                        <tr>
                            <td colspan="2" class="content-form_label" align="center">Transaction Details</td>
                        </tr>
                        <tr>
                            <td class="content-form_label">Reference No.</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="content-form_label">Name</td>
                            <td><%#Eval("FirstName")%> <%#Eval("MiddleName")%> <%#Eval("LastName")%></td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Current Address</td>
                            <td class="auto-style2"><%#Eval("CurrentAddress")%></td>
                        </tr>
                        <tr>
                            <td class="content-form_label">Phone No.</td>
                            <td><%#Eval("PhoneNumber")%></td>
                        </tr>
                        <tr class="delivery-info">
                            <td class="content-form_label">Email</td>
                            <td><%#Eval("Email")%></td>
                        </tr>
                        <tr>
                            <td class="content-form_label">Place of Birth</td>
                            <td><%#Eval("PlaceOfBirth")%></td>
                        </tr>
                    </table>
                    

                </ItemTemplate>
           </asp:Repeater>
        

            

            <br/>
            <asp:Repeater ID="repDeliveryDetails" runat="server">  
                <ItemTemplate>  
                    <table class="table table-striped">
                        <tr>
                            <td colspan="2" class="content-form_label" align="center">Delivery Details</td>
                        </tr>
                        <tr>
                            <td class="content-form_label">Mailing Address</td>
                            <td><%#Eval("MailingAddress")%></td>
                        </tr>
                        <tr>
                            <td class="content-form_label">Zip Code</td>
                            <td><%#Eval("ZipCode")%></td>
                        </tr>
                        <tr>
                            <td class="content-form_label">Delivery Area</td>
                            <td><%#Eval("DeliveryArea.Name")%></td>
                        </tr>
                        <tr>
                            <td class="content-form_label">Delivery Charge</td>
                            <td><%#Eval("DeliveryArea.Price")%></td>
                        </tr>
                        <tr>
                            <td class="content-form_label">Processing Type</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="content-form_label">Date Due to the Courier</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="content-form_label">Estimated Delivery Date</td>
                            <td></td>
                        </tr>
                    </table>
                    

                    <asp:Repeater ID="repDocumentsToDeliver" runat="server">
                        <ItemTemplate>
                            <table class="table table-striped">
                                <tr>
                                    <td class="content-form_label">Document</td>
                                    <td><%#Eval("BirthPlace")%></td>
                                </tr>
                                <tr>
                                    <td class="content-form_label">Degree</td>
                                    <td><%#Eval("")%></td>
                                </tr>
                                <tr>
                                    <td class="content-form_label">Cost</td>
                                    <td><%#Eval("BirthPlace")%></td>
                                </tr>
                                <tr>
                                    <td class="content-form_label">No. of Copies</td>
                                    <td><%#Eval("BirthPlace")%></td>
                                </tr>
                                <tr>
                                    <td class="content-form_label">Sub Total</td>
                                    <td><%#Eval("BirthPlace")%></td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="content-form_label" align="right" style="padding-right: 6px">
                                        <a href="OrderItem.aspx">Edit</a>
                                        &nbsp;<a href="DocumentList.aspx">Remove</a>
                                    </td>
                                </tr>
                            </table>
                           </ItemTemplate>
                    </asp:Repeater>
                     <br />
                     <br />
                </ItemTemplate>
            </asp:Repeater>
            <br/>

            <table class="table table-striped">
                <tr>
                    <td colspan="2" class="content-form_label" align="center">
                        Amount Due
                    </td>
                </tr>
                <tr>
                    <td class="content-form_label">Total Delivery Cost</td>
                    <td><%#Eval("")%></td>
                </tr>
                <tr>
                    <td class="content-form_label">Total Document Cost</td>
                    <td><%#Eval("")%></td>
                </tr>
                <tr>
                    <td class="content-form_label">Total Cost</td>
                    <td><%#Eval("")%></td>
                </tr>
            </table>

            <br/>

            <div style="text-align: center">
                <asp:Button class="btn btn-primary" runat="server"  Text="Back to Order List"/>
                <asp:Button class="btn btn-primary" runat="server"  Text="Pay On-Line"/>
            </div>
             
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>