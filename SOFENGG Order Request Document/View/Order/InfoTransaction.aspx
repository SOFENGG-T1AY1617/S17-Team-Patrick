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
    <div class="col-xs-3">
        <h5>Request Flow</h5>
        <ul>
            <li>
                <a href="personal_information.html">Personal Information</a>
            </li>
            <li>
                <a href="info_acad_de.html">Academic Information</a>
            </li>
            <li>
                <a href="info_mail_de.html">Mailing Information</a>
            </li>
            <li>
                <a href="document_list.html">Document List</a>
            </li>
            <li>
                <b>Checkout</b>
            </li>
        </ul>
        <div class="content-divider"></div>
    </div>

    <div class="col-xs-9">
            <h5 class="content-header" >Transaction Information</h5>

            <table border="1" class="content-form">
                <tr>
                    <td colspan="2" class="content-form_label" align="center">Transaction Details</td>
                </tr>
                <tr>
                    <td class="content-form_label">Reference No.</td>
                    <td><%#Eval("ReferenceNumber")%></td>
                </tr>
                <tr>
                    <td class="content-form_label">Name</td>
                    <td><%#Eval("Name")%></td>
                </tr>
                <tr>
                    <td class="auto-style1">Current Address</td>
                    <td class="auto-style2"><%#Eval("Address")%></td>
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
                    <td><%#Eval("BirthPlace")%></td>
                </tr>
            </table>

            <br/>
            <asp:Repeater ID="repDeliveryDetails" runat="server">  
                <ItemTemplate>  
                    <table border="1" class="content-form">
                        <tr>
                            <td colspan="2" class="content-form_label" align="center">Delivery Details</td>
                        </tr>
                        <tr>
                            <td class="content-form_label">Mailing Address</td>
                            <td><%#Eval("Address")%></td>
                        </tr>
                        <tr>
                            <td class="content-form_label">Zip Code</td>
                            <td><%#Eval("ZipCode")%></td>
                        </tr>
                        <tr>
                            <td class="content-form_label">Delivery Area</td>
                            <td><%#Eval("DeliveryArea")%></td>
                        </tr>
                        <tr>
                            <td class="content-form_label">Delivery Charge</td>
                            <td><%#Eval("DeliveryCharge")%></td>
                        </tr>
                        <tr>
                            <td class="content-form_label">Processing Type</td>
                            <td><%#Eval("ProcessingType")%></td>
                        </tr>
                        <tr>
                            <td class="content-form_label">Date Due to the Courier</td>
                            <td><%#Eval("DueDate")%></td>
                        </tr>
                        <tr>
                            <td class="content-form_label">Estimated Delivery Date</td>
                            <td><%#Eval("EstDeliveryDate")%></td>
                        </tr>
                    </table>
                    <asp:Repeater ID="repDocumentsToDeliver" runat="server">
                        <ItemTemplate>
                            <table border="1" class="content-form">
                                <tr>
                                    <td class="content-form_label">Document</td>
                                    <td><%#Eval("BirthPlace")%></td>
                                </tr>
                                <tr>
                                    <td class="content-form_label">Degree</td>
                                    <td><%#Eval("BirthPlace")%></td>
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
                                        <a href="order_item.html">Edit</a>
                                        &nbsp;<a href="document_list.html">Remove</a>
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

            <table border="1" class="content-form" style="width: 70%" align="center">
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