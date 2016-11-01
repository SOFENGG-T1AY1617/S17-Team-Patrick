<%@ Page Title="" Language="C#" MasterPageFile="~/Order/Order.Master" AutoEventWireup="true" CodeBehind="OrderItem.aspx.cs" Inherits="SOFENGG_Order_Request_Document.OrderItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Always change the css file name to html file name! -->
    <link rel="stylesheet" href="/Content/css/order_item.css">
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
                <a href="info_transaction.html">Checkout</a>
            </li>
        </ul>
        <div class="content-divider"></div>
    </div>
    <div class="col-xs-9">
        <form name "frmOrderItem" method="post" action="info_acad_de.html">
            <h5 class="content-header" class="content-form">Order Item</h5>

            <table border="1" class="content-form" align="center">
                <tbody>
                <tr>
                    <td valign="top" class="content-form_label">Document</td>
                    <td>&nbsp;Official Transcript of Records <!--Dummy Data--></td>
                </tr>
                <tr>
                    <td class="content-form_label">Academic Profile</td>
                    <td>&nbsp;CS-ST <!--Dummy Data--></td>
                </tr>
                <tr>
                    <td class="content-form_label">Price</td>
                    <td>
                        <table class="priceTable" style="border: none; width: 100%; background-color: white;">
                            <tr>
                                <td>&nbsp;<input type="radio" name="optProc" value="0">&nbsp;Regular Processing</td>
                                <td>&nbsp;Php 150.00</td>
                            </tr>
                            <tr>
                                <td>&nbsp;<input type="radio" name="optProc" value="1">&nbsp;Express Processing</td>
                                <td>&nbsp;Php 300.00</td>
                            </tr>
                            <tr>
                                <td>&nbsp;<input type="checkbox" id="for_pickup">&nbsp;For Pick Up</td>
                                <td>
                                    <select name="" id="">
                                        <option value="">DLSU-Manila</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="padding: 8px;">
                                    <span style="font-weight: bold; font-style: italic;">"Express processing is NOT available for students with ID no. <br>80XXXXX (students who entered DLSU-Manila in 1980) and below."</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="content-form_label">No. of Copies</td>
                    <td>&nbsp;<input type="text" name="txtNoCopy" size="2" maxlength="2"></td>
                </tr>
                <tr class="delivery_only">
                    <td class="content-form_label">Send to</td>
                    <td>&nbsp;385 Tapuac District Dagupan City <!--Dummy Data--></td>
                </tr>
                <tr>
                    <td class="content-form_label">Insert Document In</td>
                    <td>
                        &nbsp;
                        <input type="radio" name="optInsert" value="1"
                               onclick="stampAlert()"> Brown Envelope
                        <input type="radio" name="optInsert" value="1"
                               onclick="stampAlert()"> White Envelope
                        <input type="radio" name="optInsert" value="1"> None
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" style="padding: 8px;">
                        <a href="document_list.html">
                            <input type="button" value="Cancel" class="btn btn-primary">
                        </a>
                        <a href="info_transaction.html">
                            <input type="button" value="Add to Cart" class="btn btn-primary">
                        </a>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">

    <script src="Script/order_item.js"></script>

    <script>
        function stampAlert() {
            alert("For a DLSU security sticker to be used for sealing the envelope, please message the following email address: hub@dlsu.edu.ph.");
        }
    </script>
</asp:Content>