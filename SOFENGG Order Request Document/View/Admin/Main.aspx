<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Admin.Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Content/css/admin_main.css">
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
    <div class="main_report">
        <div class="main_report-left">
            <h3>Current Orders</h3>
        </div>
        <div class="main_report-right">
            <table class="table table-bordered">
                <tr>
                    <td><h4>Processing: <b>5</b></h4></td>
                    <td class="warning"><h4>Pending: <b>5</b></h4></td>
                    <td class="success"><h4>On Time: <b>5</b></h4></td>
                    <td class="danger"><h4>Late: <b>5</b></h4></td>
                    <td><h4>Total Quantity: <b>30</b></h4></td>
                </tr>
            </table>
        </div>
    </div>

    <table class="table table-hover table-bordered">
        <thead>
            <tr> 
                <td>Reference Number</td>
                <td>Transaction Date</td>
                <td>Date Due</td>
                <td>Status</td>
                <td>Name</td>
                <td>Amount</td>
            </tr>
        </thead>
        <tbody>
            <tr class="danger">
                <td>0</td>
                <td>11/05/2016</td>
                <td>11/09/2016</td>
                <td>Late</td>
                <td>Dock Pad</td>
                <td>300.00</td>
            </tr>
            <tr>
                <td>1</td>
                <td>11/10/2016</td>
                <td>11/15/2016</td>
                <td>Processing</td>
                <td>Samsung Waters</td>
                <td>500.00</td>
            </tr>
            <tr class="warning">
                <td>2</td>
                <td>11/10/2016</td>
                <td>11/15/2016</td>
                <td>Pending</td>
                <td>Apple Oranges</td>
                <td>200.00</td>
            </tr>
            <tr class="success">
                <td>3</td>
                <td>11/10/2016</td>
                <td>11/11/2016</td>
                <td>Done</td>
                <td>Watch Shock</td>
                <td>300.00</td>
            </tr>
             <tr class="danger">
                <td>0</td>
                <td>11/05/2016</td>
                <td>11/09/2016</td>
                <td>Late</td>
                <td>Dock Pad</td>
                <td>300.00</td>
            </tr>
            <tr>
                <td>1</td>
                <td>11/10/2016</td>
                <td>11/15/2016</td>
                <td>Processing</td>
                <td>Samsung Waters</td>
                <td>500.00</td>
            </tr>
            <tr class="warning">
                <td>2</td>
                <td>11/10/2016</td>
                <td>11/15/2016</td>
                <td>Pending</td>
                <td>Apple Oranges</td>
                <td>200.00</td>
            </tr>
            <tr class="success">
                <td>3</td>
                <td>11/10/2016</td>
                <td>11/11/2016</td>
                <td>Done</td>
                <td>Watch Shock</td>
                <td>300.00</td>
            </tr>
            <tr class="danger">
                <td>0</td>
                <td>11/05/2016</td>
                <td>11/09/2016</td>
                <td>Late</td>
                <td>Dock Pad</td>
                <td>300.00</td>
            </tr>
            <tr>
                <td>1</td>
                <td>11/10/2016</td>
                <td>11/15/2016</td>
                <td>Processing</td>
                <td>Samsung Waters</td>
                <td>500.00</td>
            </tr>
            <tr class="warning">
                <td>2</td>
                <td>11/10/2016</td>
                <td>11/15/2016</td>
                <td>Pending</td>
                <td>Apple Oranges</td>
                <td>200.00</td>
            </tr>
            <tr class="success">
                <td>3</td>
                <td>11/10/2016</td>
                <td>11/11/2016</td>
                <td>Done</td>
                <td>Watch Shock</td>
                <td>300.00</td>
            </tr>
            <tr class="danger">
                <td>0</td>
                <td>11/05/2016</td>
                <td>11/09/2016</td>
                <td>Late</td>
                <td>Dock Pad</td>
                <td>300.00</td>
            </tr>
            <tr>
                <td>1</td>
                <td>11/10/2016</td>
                <td>11/15/2016</td>
                <td>Processing</td>
                <td>Samsung Waters</td>
                <td>500.00</td>
            </tr>
            <tr class="warning">
                <td>2</td>
                <td>11/10/2016</td>
                <td>11/15/2016</td>
                <td>Pending</td>
                <td>Apple Oranges</td>
                <td>200.00</td>
            </tr>
            <tr class="success">
                <td>3</td>
                <td>11/10/2016</td>
                <td>11/11/2016</td>
                <td>Done</td>
                <td>Watch Shock</td>
                <td>300.00</td>
            </tr>
            <tr class="danger">
                <td>0</td>
                <td>11/05/2016</td>
                <td>11/09/2016</td>
                <td>Late</td>
                <td>Dock Pad</td>
                <td>300.00</td>
            </tr>
            <tr>
                <td>1</td>
                <td>11/10/2016</td>
                <td>11/15/2016</td>
                <td>Processing</td>
                <td>Samsung Waters</td>
                <td>500.00</td>
            </tr>
            <tr class="warning">
                <td>2</td>
                <td>11/10/2016</td>
                <td>11/15/2016</td>
                <td>Pending</td>
                <td>Apple Oranges</td>
                <td>200.00</td>
            </tr>
            <tr class="success">
                <td>3</td>
                <td>11/10/2016</td>
                <td>11/11/2016</td>
                <td>Done</td>
                <td>Watch Shock</td>
                <td>300.00</td>
            </tr>
            <tr class="danger">
                <td>0</td>
                <td>11/05/2016</td>
                <td>11/09/2016</td>
                <td>Late</td>
                <td>Dock Pad</td>
                <td>300.00</td>
            </tr>
            <tr>
                <td>1</td>
                <td>11/10/2016</td>
                <td>11/15/2016</td>
                <td>Processing</td>
                <td>Samsung Waters</td>
                <td>500.00</td>
            </tr>
            <tr class="warning">
                <td>2</td>
                <td>11/10/2016</td>
                <td>11/15/2016</td>
                <td>Pending</td>
                <td>Apple Oranges</td>
                <td>200.00</td>
            </tr>
            <tr class="success">
                <td>3</td>
                <td>11/10/2016</td>
                <td>11/11/2016</td>
                <td>Done</td>
                <td>Watch Shock</td>
                <td>300.00</td>
            </tr>
        </tbody>
    </table>
</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script src="/Script/admin_main.js"></script>
</asp:Content>