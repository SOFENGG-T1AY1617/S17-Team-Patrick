<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="DocumentList.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.DocumentList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Always change the css file name to html file name! -->
    <link rel="stylesheet" href="/Content/css/document_list.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <form id="form1" runat="server">
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
                <b>Document List</b>
            </li>
            <li>
                <a href="info_transaction.html">Checkout</a>
            </li>
        </ul>
        <div class="content-divider"></div>
        <h5>User Information</h5>
        <ul>
            <li>Name</li>
            <li>Address</li>
            <li>ID Number</li>
        </ul>
    </div>
    <div class="col-xs-9">
        <h5 class="content-header">Document List</h5>
        <table border="1" class="content-document">
            <tr>
                <td colspan="4" class="content-document-header">Below is a list of documents that you can request from the OUR. Press the order link to the document you want to order.</td>
            </tr>
            <tr>
                <td colspan="2" class="">Document</td>
                <td>Regular Process</td>
                <td>Express Process</td>
            </tr>
            <tr>
                <td colspan="4" class="content-document-header">Transcript of Records</td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="order_item.html">Official TOR for Evaluation</a>
                </td>
                <td>PHP 150.00</td>
                <td>PHP 300.00</td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="order_item.html">Official TOR for Employment</a>
                </td>
                <td>PHP 150.00</td>
                <td>PHP 300.00</td>
            </tr>
            <tr class="forEarlyAlumniTOR" style="display: none">
                <td colspan="2">
                    <a href="order_item.html">Official TOR for Employment</a>
                </td>
                <td>PHP 150.00</td>
                <td>Unavailable</td>
            </tr>
            <tr>
                <td colspan="4" class="content-document-header">Certification</td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="order_item.html">Course Subject Description</a>
                </td>
                <td>PHP 150.00</td>
                <td>Unavailable</td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="order_item.html">Ranking By Degree Program</a>
                </td>
                <td>PHP 150.00</td>
                <td>Unavailable</td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="order_item.html">Ranking By College</a>
                </td>
                <td>PHP 150.00</td>
                <td>Unavailable</td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="order_item.html">Trimestral Calendar</a>
                </td>
                <td>PHP 150.00</td>
                <td>Unavailable</td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="order_item.html">Completion of Academic Units</a>
                </td>
                <td>PHP 150.00</td>
                <td>Unavailable</td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="order_item.html">Cumulative GPA</a>
                </td>
                <td>PHP 150.00</td>
                <td>Unavailable</td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="order_item.html">Dean's List</a>
                </td>
                <td>PHP 150.00</td>
                <td>Unavailable</td>
            </tr>
            <tr>
                <td colspan="4" class="content-document-header">Certified True Copy</td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="order_item.html">Form 137</a>
                </td>
                <td>PHP 150.00</td>
                <td>Unavailable</td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="order_item.html">Official Transcript of Records</a>
                </td>
                <td>PHP 150.00</td>
                <td>Unavailable</td>
            </tr>
            <tr>
                <td colspan="4" class="content-document-header">Others</td>
            </tr>
            <tr>
                <td colspan="2">
                    <a href="order_item.html">Special Credentials</a>
                </td>
                <td>PHP 150.00</td>
                <td>Unavailable</td>
            </tr>
        </table>
    </div>

    <div class="col-xs-10">
        <asp:ListView ID="lvDocumentList" runat="server" >
            <LayoutTemplate>
                <table border="1" class="content-document">
                    <tr>
                        <th colspan="4" class="content-document-header">Below is a list of documents that you can request from the OUR. Press the order link to the document you want to order.</th>
                    </tr>
                    <tr>
                        <td colspan="2" class="">Document</td>
                        <td>Regular Process</td>
                        <td>Express Process</td>
                    </tr>
                    <tr>
                        <th colspan="4" class="content-document-header">Transcript of Records</th>
                    </tr>
                    <asp:Placeholder ID ="itemPlaceholder" runat="server"></asp:Placeholder>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    
                    <td colspan="2"><%#Eval("Name") %></td>
                    <td><%#Eval("RegularPrice") %></td>
                    <td><%#Eval("ExpressPrice") %></td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
        
    </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>