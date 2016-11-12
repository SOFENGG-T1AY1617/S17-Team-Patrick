<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DocumentList.aspx.cs" Inherits="SOFENGG_Order_Request_Document.Admin.DocumentList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/css/admin_order_information.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container content">
      <div class="row">
        <div class="col-xs-2 content-sidebar">
          <h3>Menu</h3>
          <br>
          <ul>
            <li><a href="admin_main.html">Home</a></li>
            <li><b>Maintain Document List</b></li>
            <li>Update Operational Date</li>
          </ul>
          <br>
          <ul>
            <li>Current Orders</li>
            <li>Pending Orders</li>
            <li>Cancelled Orders</li>
            <li>Previous Orders</li>
          </ul>
        </div>
        <div class="col-xs-9 col-xs-offset-1 content-main">
            <div>
                <h1>Reference Number 83218421</h1>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <td colspan="2">Transaction Details</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Name</td>
                            <td>Samsung Waters</td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td>De La Salle University, Manila City</td>
                        </tr>
                        <tr>
                            <td>Phone Number</td>
                            <td>639178637629</td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>dlsu_edu@dlsu_edu.ph</td>
                        </tr>
                        <tr>
                            <td>Place of Birth</td>
                            <td>Philippines</td>
                        </tr>
                    </tbody>
                </table>

                <div class="delivery_details_table">
                    <table class="table table-bordered table_start">
                        <thead>
                            <tr>
                                <td colspan="2">Delivery Details</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="col-md-5">Mailing Address</td>
                                <td>Sun Residences, Quezon City</td>
                            </tr>
                            <tr>
                                <td>Zip Code</td>
                                <td>11555</td>
                            </tr>
                            <tr>
                                <td>Delivery Area</td>
                                <td>Quezon City</td>
                            </tr>
                            <tr>
                                <td>Delivery Charge</td>
                                <td>PHP 128.00</td>
                            </tr>
                            <tr>
                                <td>Processing Type</td>
                                <td>Regular</td>
                            </tr>
                            <tr>
                                <td>Date Due To Courier</td>
                                <td>11/16/2016</td>
                            </tr>
                            <tr>
                                <td>Estimated Delivery Date</td>
                                <td>11/15/2016</td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table table-bordered">
                        <tr>
                            <td class="col-md-5">Document</td>
                            <td>Official TOR for Employment</td>
                        </tr>
                        <tr>
                            <td>Degree</td>
                            <td>BS Computer Science</td>
                        </tr>
                        <tr>
                            <td>Cost</td>
                            <td>PHP 150.00</td>
                        </tr>
                        <tr>
                            <td>No. of Copies</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td>Envelope</td>
                            <td>White</td>
                        </tr>
                        <tr>
                            <td>Sub Total</td>
                            <td>PHP 150.00</td>
                        </tr>
                    </table>
                    <table class="table table-bordered">
                        <tr>
                            <td class="col-md-5">Document</td>
                            <td>Special Credentials Form</td>
                        </tr>
                        <tr>
                            <td>Degree</td>
                            <td>BS Computer Science</td>
                        </tr>
                        <tr>
                            <td>Cost</td>
                            <td>PHP 150.00</td>
                        </tr>
                        <tr>
                            <td>No. of Copies</td>
                            <td>2</td>
                        </tr>
                        <tr>
                            <td>Envelope</td>
                            <td>Brown</td>
                        </tr>
                        <tr>
                            <td>Sub Total</td>
                            <td>PHP 300.00</td>
                        </tr>
                    </table>

                    <table class="table table-bordered table_start">
                        <thead>
                            <tr>
                                <td colspan="2">Delivery Details</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="col-md-5">Mailing Address</td>
                                <td>Pillow Factory, Manila City</td>
                            </tr>
                            <tr>
                                <td>Zip Code</td>
                                <td>99222</td>
                            </tr>
                            <tr>
                                <td>Delivery Area</td>
                                <td>Manila City</td>
                            </tr>
                            <tr>
                                <td>Delivery Charge</td>
                                <td>PHP 128.00</td>
                            </tr>
                            <tr>
                                <td>Processing Type</td>
                                <td>Express</td>
                            </tr>
                            <tr>
                                <td>Date Due To Courier</td>
                                <td>11/18/2016</td>
                            </tr>
                            <tr>
                                <td>Estimated Delivery Date</td>
                                <td>11/18/2016</td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="table table-bordered">
                        <tr>
                            <td class="col-md-5">Document</td>
                            <td>Official TOR for Employment</td>
                        </tr>
                        <tr>
                            <td>Degree</td>
                            <td>BS Computer Science</td>
                        </tr>
                        <tr>
                            <td>Cost</td>
                            <td>PHP 150.00</td>
                        </tr>
                        <tr>
                            <td>No. of Copies</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td>Envelope</td>
                            <td>Brown</td>
                        </tr>
                        <tr>
                            <td>Sub Total</td>
                            <td>PHP 150.00</td>
                        </tr>
                    </table>
                    <table class="table table-bordered">
                        <tr>
                            <td class="col-md-5">Document</td>
                            <td>Special Credentials Form</td>
                        </tr>
                        <tr>
                            <td>Degree</td>
                            <td>BS Computer Science</td>
                        </tr>
                        <tr>
                            <td>Cost</td>
                            <td>PHP 150.00</td>
                        </tr>
                        <tr>
                            <td>No. of Copies</td>
                            <td>3</td>
                        </tr>
                        <tr>
                            <td>Envelope</td>
                            <td>Brown</td>
                        </tr>
                        <tr>
                            <td>Sub Total</td>
                            <td>PHP 450.00</td>
                        </tr>
                    </table>
                </div>
                
                <div>
                    <table class="table table-bordered">
                        <tr>
                            <td colspan="2" class="content-form_label" align="center">Amount Due</td>
                        </tr>
                        <tr>
                            <td>Total Delivery Cost</td>
                            <td>PHP 256.00</td>
                        </tr>
                        <tr>
                            <td>Total Document Cost</td>
                            <td>PHP 900.00</td>
                        </tr>
                        <tr>
                            <td>Total Cost</td>
                            <td>PHP 1156.00</td>
                        </tr>
                    </table>
                </div>
                
<%--            Only display "mark as pending" and "mark as done" when currentorder is processing and NOT pending already--%>
                <div class="content_buttons">
                    <button class="btn btn-primary">Back</button>
                    <button class="btn btn-danger">Mark as Pending</button>
                    <button class="btn btn-success">Mark as Done</button>
                    <button class="btn btn-warning">Mark as Processing</button>
                </div>
            </div>
        </div>
      </div>
    </div>
</asp:Content>