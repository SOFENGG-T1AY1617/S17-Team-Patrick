<%@ Page Title="" Language="C#" MasterPageFile="~/Order/Order.Master" AutoEventWireup="true" CodeBehind="InfoTransaction.aspx.cs" Inherits="SOFENGG_Order_Request_Document.InfoTransaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Always change the css file name to html file name! -->
    <link rel="stylesheet" href="/Content/css/info_transaction.css">
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
        <form name "frmTransaction" method="post" action="info_transaction.html">
            <h5 class="content-header">Transaction Information</h5>

            <table border="1" class="content-form">
                <tr>
                    <td colspan="2" class="content-form_label" align="center">Transaction Details</td>
                </tr>
                <tr>
                    <td class="content-form_label">Reference No.</td>
                    <td>1164824547</td>
                </tr>
                <tr>
                    <td class="content-form_label">Name</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="content-form_label">Current Address</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="content-form_label">Phone No.</td>
                    <td></td>
                </tr>
                <tr class="delivery-info">
                    <td class="content-form_label">Email</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="content-form_label">Place of Birth</td>
                    <td></td>
                </tr>
            </table>

            <br>

            <table border="1" class="content-form">
                <tr>
                    <td colspan="2" class="content-form_label" align="center">Delivery Details</td>
                </tr>
                <tr>
                    <td class="content-form_label">Mailing Address</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="content-form_label">Zip Code</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="content-form_label">Delivery Area</td>
                    <td> </td>
                </tr>
                <tr>
                    <td class="content-form_label">Delivery Charge</td>
                    <td> </td>
                </tr>
                <tr>
                    <td class="content-form_label">Processing Type</td>
                    <td> </td>
                </tr>
                <tr>
                    <td class="content-form_label">Date Due to the Courier</td>
                    <td> </td>
                </tr>
                <tr>
                    <td class="content-form_label">Estimated Delivery Date</td>
                    <td> </td>
                </tr>
            </table>

            <table border="1" class="content-form">
                <tr>
                    <td class="content-form_label">Document</td>
                    <td> </td>
                </tr>
                <tr>
                    <td class="content-form_label">Degree</td>
                    <td> </td>
                </tr>
                <tr>
                    <td class="content-form_label">Cost</td>
                    <td> </td>
                </tr>
                <tr>
                    <td class="content-form_label">No. of Copies</td>
                    <td>1</td>
                </tr>
                <tr>
                    <td class="content-form_label">Sub Total</td>
                    <td> </td>
                </tr>

                <tr>
                    <td colspan="2" class="content-form_label" align="right" style="padding-right: 6px">
                        <a href="order_item.html">Edit</a>
                        &nbsp;<a href="document_list.html">Remove</a>
                    </td>
                </tr>
            </table>

            <br>

            <table border="1" class="content-form" style="width: 70%" align="center">
                <tr>
                    <td colspan="2" class="content-form_label" align="center">
                        Amount Due
                    </td>
                </tr>
                <tr>
                    <td class="content-form_label">Total Delivery Cost</td>
                    <td> Php 128.00 </td>
                </tr>
                <tr>
                    <td class="content-form_label">Total Document Cost</td>
                    <td> Php 150.00 </td>
                </tr>
                <tr>
                    <td class="content-form_label">Total Cost</td>
                    <td> Php 278.00 </td>
                </tr>
            </table>

            <br>

            <div style="text-align: center">
                <a href="document_list.html" class="btn btn-primary">Back to Order List</a>
                <a href="" class="btn btn-primary" disabled="true">Pay On-Line</a>
            </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>