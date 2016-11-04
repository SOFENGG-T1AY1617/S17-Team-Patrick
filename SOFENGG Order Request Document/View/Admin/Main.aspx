<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Admin.Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
<div class="col-xs-2 content-sidebar">
    <h3>Menu</h3>
    <br>
    <ul>
        <li>
            <b>Home</b>
        </li>
        <li>
            <a href="admin_document_list.html">Maintain Document List</a>
        </li>
        <li>Update Operational Date</li>
    </ul>
    <br>
    <ul>
        <li>Current Orders</li>
        <li>
            <a href="admin_pending.html">Pending Orders</a>
        </li>
        <li>Cancelled Orders</li>
        <li>Previous Orders</li>
    </ul>
</div>
<div class="col-xs-9 col-xs-offset-1 content-main">
<h3>Current Orders</h3>

<div class="content-scrolling">
<div>
<table class="table table-hover">
<thead>
<tr>
    <td>Reference Number</td>
    <td>Transaction Date</td>
    <td>Due Date</td>
    <td>Status</td>
    <td>Name</td>
    <td>Amount</td>
</tr>
</thead>
<tbody>
<tr>
    <td class="details">1164824547</td>
    <td>10-21-2016</td>
    <td>10-28-2016</td>
    <td>
        <button class="btn btn-xs btn-default can_pend">Processing</button>
    </td>
    <td>DO, Kyu Min</td>
    <td>PHP 278.00</td>
</tr>
<tr>
    <td class="details">1164824507</td>
    <td>10-11-2016</td>
    <td>10-18-2016</td>
    <td class="danger">Late</td>
    <td>DO, Kyu Min</td>
    <td>PHP 358.00</td>
</tr>
<tr>
    <td class="details">1164824508</td>
    <td>10-11-2016</td>
    <td>10-18-2016</td>
    <td class="danger">Late</td>
    <td>DO, Kyu Min</td>
    <td>PHP 552.00</td>
</tr>
<tr>
    <td class="details">1164824509</td>
    <td>10-12-2016</td>
    <td>10-19-2016</td>
    <td class="danger">Late</td>
    <td>DO, Kyu Min</td>
    <td>PHP 270.00</td>
</tr>
<tr>
    <td class="details">1164824510</td>
    <td>10-13-2016</td>
    <td>10-20-2016</td>
    <td class="danger">Late</td>
    <td>DO, Kyu Min</td>
    <td>PHP 150.00</td>
</tr>
<tr>
    <td class="details">1164824511</td>
    <td>10-13-2016</td>
    <td>10-20-2016</td>
    <td class="danger">Late</td>
    <td>DO, Kyu Min</td>
    <td>PHP 250.00</td>
</tr>
<tr>
    <td class="details">1164824485</td>
    <td>10-08-2016</td>
    <td>10-22-2016</td>
    <td>
        <button class="btn btn-xs btn-warning can_process">Pending</button>
    </td>
    <td>DO, Kyu Min</td>
    <td>PHP 300.00</td>
</tr>
<tr>
    <td class="details">1164824487</td>
    <td>10-15-2016</td>
    <td>10-29-2016</td>
    <td>
        <button class="btn btn-xs btn-warning can_process">Pending</button>
    </td>
    <td>DO, Kyu Min</td>
    <td>PHP 420.00</td>
</tr>
<tr>
    <td class="details">1164824520</td>
    <td>10-15-2016</td>
    <td>10-22-2016</td>
    <td>
        <button class="btn btn-xs btn-default can_pend">Processing</button>
    </td>
    <td>DO, Kyu Min</td>
    <td>PHP 150.00</td>
</tr>
<tr>
    <td class="details">1164824521</td>
    <td>10-15-2016</td>
    <td>10-22-2016</td>
    <td>
        <button class="btn btn-xs btn-default can_pend">Processing</button>
    </td>
    <td>DO, Kyu Min</td>
    <td>PHP 150.00</td>
</tr>
<tr>
    <td class="details">1164824522</td>
    <td>10-15-2016</td>
    <td>10-22-2016</td>
    <td>
        <button class="btn btn-xs btn-default can_pend">Processing</button>
    </td>
    <td>DO, Kyu Min</td>
    <td>PHP 150.00</td>
</tr>
<tr>
    <td class="details">1164824523</td>
    <td>10-15-2016</td>
    <td>10-22-2016</td>
    <td>
        <button class="btn btn-xs btn-default can_pend">Processing</button>
    </td>
    <td>DO, Kyu Min</td>
    <td>PHP 300.00</td>
</tr>
<tr>
    <td class="details">1164824524</td>
    <td>10-15-2016</td>
    <td>10-22-2016</td>
    <td>
        <button class="btn btn-xs btn-default can_pend">Processing</button>
    </td>
    <td>DO, Kyu Min</td>
    <td>PHP 150.00</td>
</tr>
<tr>
    <td class="details">1164824525</td>
    <td>10-15-2016</td>
    <td>10-22-2016</td>
    <td>
        <button class="btn btn-xs btn-default can_pend">Processing</button>
    </td>
    <td>DO, Kyu Min</td>
    <td>PHP 450.00</td>
</tr>
<tr>
    <td class="details">1164824526</td>
    <td>10-16-2016</td>
    <td>10-23-2016</td>
    <td>
        <button class="btn btn-xs btn-default can_pend">Processing</button>
    </td>
    <td>DO, Kyu Min</td>
    <td>PHP 150.00</td>
</tr>
<tr>
    <td class="details">1164824527</td>
    <td>10-16-2016</td>
    <td>10-23-2016</td>
    <td>
        <button class="btn btn-xs btn-default can_pend">Processing</button>
    </td>
    <td>DO, Kyu Min</td>
    <td>PHP 600.00</td>
</tr>
<tr>
    <td class="details">1164824528</td>
    <td>10-16-2016</td>
    <td>10-23-2016</td>
    <td>
        <button class="btn btn-xs btn-default can_pend">Processing</button>
    </td>
    <td>DO, Kyu Min</td>
    <td>PHP 250.00</td>
</tr>
<tr>
    <td class="details">1164824529</td>
    <td>10-17-2016</td>
    <td>10-24-2016</td>
    <td>
        <button class="btn btn-xs btn-default can_pend">Processing</button>
    </td>
    <td>DO, Kyu Min</td>
    <td>PHP 150.00</td>
</tr>
<tr>
    <td class="details">1164824514</td>
    <td>10-13-2016</td>
    <td>10-20-2016</td>
    <td class="success">Done</td>
    <td>DO, Kyu Min</td>
    <td>PHP 120.00</td>
</tr>
<tr>
    <td class="details">1164824515</td>
    <td>10-13-2016</td>
    <td>10-20-2016</td>
    <td class="success">Done</td>
    <td>DO, Kyu Min</td>
    <td>PHP 370.00</td>
</tr>
<tr>
    <td class="details">1164824516</td>
    <td>10-13-2016</td>
    <td>10-20-2016</td>
    <td class="success">Done</td>
    <td>DO, Kyu Min</td>
    <td>PHP 480.00</td>
</tr>
<tr>
    <td class="details">1164824517</td>
    <td>10-14-2016</td>
    <td>10-21-2016</td>
    <td class="success">Done</td>
    <td>DO, Kyu Min</td>
    <td>PHP 150.00</td>
</tr>
<tr>
    <td class="details">1164824518</td>
    <td>10-14-2016</td>
    <td>10-21-2016</td>
    <td class="success">Done</td>
    <td>DO, Kyu Min</td>
    <td>PHP 120.00</td>
</tr>
</tbody>
</table>
</div>
</div>
<div class="content-main_report">
    <p align="right">Total Quantity: <b>23</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Late: <b>5</b>
    <p align="right">
        On Time: <b>5</b>
    </p>
</div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="other" runat="server">

    <div class="details-popup">

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
                <td>DO, Kyu Min</td>
            </tr>
            <tr>
                <td class="content-form_label">Current Address</td>
                <td>Unit 3232 Tower 2 Sun Residences, Quezon City</td>
            </tr>
            <tr>
                <td class="content-form_label">Phone No.</td>
                <td>87000</td>
            </tr>
            <tr class="delivery-info">
                <td class="content-form_label">Email</td>
                <td>kyu_min_do@dlsu.edu.ph</td>
            </tr>
            <tr>
                <td class="content-form_label">Place of Birth</td>
                <td>Quezon City</td>
            </tr>
        </table>

        <br>

        <table border="1" class="content-form">
            <tr>
                <td colspan="2" class="content-form_label" align="center">Delivery Details</td>
            </tr>
            <tr>
                <td class="content-form_label">Mailing Address</td>
                <td>Unit 3232 Tower 2 Sun Residences, Quezon City</td>
            </tr>
            <tr>
                <td class="content-form_label">Zip Code</td>
                <td>2400</td>
            </tr>
            <tr>
                <td class="content-form_label">Delivery Area</td>
                <td>Quezon City</td>
            </tr>
            <tr>
                <td class="content-form_label">Delivery Charge</td>
                <td>Php 128.00</td>
            </tr>
            <tr>
                <td class="content-form_label">Processing Type</td>
                <td>Regular Processing</td>
            </tr>
            <tr>
                <td class="content-form_label">Date Due to the Courier</td>
                <td>Oct 27 2016</td>
            </tr>
            <tr>
                <td class="content-form_label">Estimated Delivery Date</td>
                <td>Oct 28 2016</td>
            </tr>
        </table>

        <table border="1" class="content-form">
            <tr>
                <td class="content-form_label">Document</td>
                <td>Official TOR for Employment</td>
            </tr>
            <tr>
                <td class="content-form_label">Degree</td>
                <td>Bachelor - CS-ST</td>
            </tr>
            <tr>
                <td class="content-form_label">Cost</td>
                <td>Php 150.00</td>
            </tr>
            <tr>
                <td class="content-form_label">No. of Copies</td>
                <td>1</td>
            </tr>
            <tr>
                <td class="content-form_label">Sub Total</td>
                <td>Php 150.00</td>
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
                <td>Php 128.00</td>
            </tr>
            <tr>
                <td class="content-form_label">Total Document Cost</td>
                <td style="padding-left: 5px;">Php 150.00</td>
            </tr>
            <tr>
                <td class="content-form_label">Total Cost</td>
                <td>Php 278.00</td>
            </tr>
        </table>

        <br>
        <div style="padding-bottom: 20px;">
            <button id="back_popup" class="btn btn-primary">Back</button>
            <button id="markasdone_popup" class="btn btn-primary">Mark as Done</button>
        </div>
    </div>

    <div class="popup pending">
        <p>Reference No: 1164824508</p>
        <p>Reason For Delay:</p>
        <textarea name="" id="" cols="32" rows="10"></textarea>
        <div>
            <button id="cancel_popup" class="btn btn-primary">Cancel</button>
            <button id="save_popup" class="btn btn-primary">Save</button>
        </div>
    </div>

    <div class="popup process">
        <h4>New Due Date</h4>
        <select name="" id="">
            <option value="">January</option>
            <option value="">February</option>
            <option value="">March</option>
            <option value="">April</option>
            <option value="">May</option>
            <option value="">June</option>
            <option value="">July</option>
            <option value="">August</option>
            <option value="">September</option>
            <option value="">October</option>
            <option value="">November</option>
            <option value="">December</option>
        </select>
        <select name="" id="day"></select>
        <select name="" id="year"></select>
        <br>
        <br>
        <button id="cancelprocess_popup" class="btn btn-primary">Mark As Processing</button>
        <button id="mark_processing_popup" class="btn btn-primary">Cancel</button>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script src="/Script/admin_main.js"></script>
</asp:Content>