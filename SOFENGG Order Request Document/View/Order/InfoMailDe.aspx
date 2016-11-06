<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="InfoMailDe.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.InfoMailDe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Always change the css file name to html file name! -->
    <link rel="stylesheet" href="/Content/css/info_mail_de.css">
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
                <b>Mailing Information</b>
            </li>
            <li>Document List</li>
            <li>Checkout</li>
        </ul>
        <div class="content-divider"></div>
    </div>

    <div class="col-xs-9">
        <h5 class="content-header">Mail Information</h5>

        <p>
            This step allows you to enter your mailing information.
            <br>
            <br>
            You may want your documents delivered to more than one mailing address. Enter the addresses here.
        </p>
        <form action=""></form>
        <table border=1 class="content-form">

            <tr class="delivery-info">
                <td class="content-form_label">Mailing Address</td>
                <td style="padding-left: 5px; padding-bottom: 3px;">
                    <textarea name="" id="" cols="30" rows="3"></textarea>
                </td>
            </tr>
            <tr class="delivery-info">
                <td class="content-form_label">Zip Code</td>
                <td>
                    &nbsp;<input type="text" name="" maxlength="8" size="6" value>
                </td>
            </tr>
            <tr class="delivery-info">
                <td class="content-form_label">Delivery Area</td>

                <td style="padding-left: 5px;">
                    <select name="cboDelivery" style="width: 250px" class="form">
                        <option value="46">Africa</option>
                        <option value="47">Australia</option>
                        <option value="48">Brunei</option>
                        <option value="49">Canada</option>
                        <option value="50">China</option>
                        <option value="51">Europe</option>
                        <option value="52">Fiji Island</option>
                        <option value="53">Guam</option>
                        <option value="54">Hongkong / Singapore</option>
                        <option value="55">Indonesia / Malaysia / Taiwan / Thailand</option>
                        <option value="56">Japan</option>
                        <option value="59">Mexico City</option>
                        <option value="60">Middle East</option>
                        <option value="62">New Zealand</option>
                        <option value="63">Papua New Guinea</option>
                        <option value="57">Philippines: Luzon</option>
                        <option value="58" selected="">Philippines: Metro Manila</option>
                        <option value="61">Philippines: Mindanao</option>
                        <option value="66">Philippines: Visayas</option>
                        <option value="64">South Korea</option>
                        <option value="65">USA</option>
                        <option value="67">South America</option>
                        <option value="377">Vietnam</option>
                    </select>

                    <!-- DELIVERY RATES (pop-up)
                    <a onclick="javascript:window.open ('popDelivery.asp','help','scrollbars=yes,
															resizable=no,width=575,height=500,top=100,
															left=100');return false;" href="/#">
                        <img src="../images/xis_sm2.gif" alt="delivery rates" border="0">
                    </a>
                    -->
                </td>
            </tr>
            <tr class="delivery-info">
                <td class="content-form_label">Mailing Contact Number</td>
                <td>&nbsp;<input type="text" name="" value></td>
            </tr>


        </table>
        <a href="info_mail_confirm.html">
            <button class="btn btn-primary content-form_next">Next</button>
        </a>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>