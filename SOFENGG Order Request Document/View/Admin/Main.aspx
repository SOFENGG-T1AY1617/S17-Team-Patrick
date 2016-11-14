<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Admin.Main" %>

<%@ Import Namespace="SOFENGG_Order_Request_Document.Model" %>
<%@ Import Namespace="SOFENGG_Order_Request_Document.Model.Helper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Content/css/admin_main.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="sm" runat="server" EnablePageMethods="true" EnablePartialRendering="true"></asp:ScriptManager>
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
                        <td>
                            <h4>Processing: <b>
                                <asp:Label ID="lblProcessingCount" runat="server" /></b></h4>
                        </td>
                        <td class="warning">
                            <h4>Pending: <b>
                                <asp:Label ID="lblPendingCount" runat="server" /></b></h4>
                        </td>
                        <td class="success">
                            <h4>On Time: <b>
                                <asp:Label ID="lblOnTimeCount" runat="server" /></b></h4>
                        </td>
                        <td class="danger">
                            <h4>Late: <b>
                                <asp:Label ID="lblLateCount" runat="server" /></b></h4>
                        </td>
                        <td>
                            <h4>Total Quantity: <b>
                                <asp:Label ID="lblTotalCount" runat="server" /></b></h4>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <asp:Repeater ID="repOrders" runat="server">
            <HeaderTemplate>
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
            </HeaderTemplate>
            <ItemTemplate>
                <tr class='<%#SetRowClass((OrderStatusEnum) Eval("OrderStatus")) %>' data-toggle="modal" data-target="#dlgOrderInformation" onclick="__doPostBack('cmdUpdateOrderInformation','<%# Eval("ReferenceNo") %>')">
                    <td>
                        <asp:Label ID="lblReferenceNo" runat="server" Text='<%# Eval("ReferenceNo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblTransactionDate" runat="server" Text='<%# Eval("TransactionDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblDueDate" runat="server" Text='<%# Convert.ToDateTime(Eval("DueDate")).ToString("d") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# ((OrderStatusEnum) Eval("OrderStatus")).GetDescription() %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Receiver.FirstName") + " " + (!string.IsNullOrEmpty(Eval("Receiver.MiddleName").ToString()) ? Eval("Receiver.MiddleName") + " " : "") + Eval("Receiver.LastName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblAmount" runat="server" Text='<%# float.Parse(Eval("TotalAmount").ToString()).ToString("n2") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
            </table>
            </FooterTemplate>
        </asp:Repeater>

        <%--                <tr class="success">
                    <td>3</td>
                    <td>11/10/2016</td>
                    <td>11/11/2016</td>
                    <td>OnTime</td>
                    <td>Watch Shock</td>
                    <td>300.00</td>
                </tr>--%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="other" runat="server">

    <div class="modal fade" id="dlgOrderInformation" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upOrderInformation" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <input type="hidden" id="cmdUpdateOrderInformation" />
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4>Reference Number
                                <asp:Label ID="lblActiveReferenceNo" runat="server"></asp:Label></h4>
                        </div>
                        <div class="modal-body">

                            <div>

                                <table class="table table-bordered">
                                    <thead>
                                        <tr class="active">
                                            <td colspan="2">Transaction Details</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Name</td>
                                            <td>
                                                <asp:Label ID="lblActiveOrderName" runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td>Address</td>
                                            <td>
                                                <asp:Label ID="lblActiveOrderAddress" runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td>Phone Number</td>
                                            <td>
                                                <asp:Label ID="lblActiveOrderPhoneNumber" runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td>
                                                <asp:Label ID="lblActiveOrderEmail" runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td>Place of Birth</td>
                                            <td>
                                                <asp:Label ID="lblActiveOrderPlaceOfBirth" runat="server" /></td>
                                        </tr>
                                    </tbody>
                                </table>

                                <asp:Repeater ID="repOrderMailingInfo" runat="server">
                                    <ItemTemplate>
                                        <div class="delivery_details_table">
                                            <table class="table table-bordered table_start">
                                                <thead>
                                                    <tr class="active">
                                                        <td colspan="2">Delivery Details</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="col-md-5">Mailing Address</td>
                                                        <td>
                                                            <asp:Label ID="lblMailingAddress" runat="server" Text='<%# Eval("MailingAddress.MailingAddress") %>' /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Zip Code</td>
                                                        <td>
                                                            <asp:Label ID="lblZipCode" runat="server" Text='<%# Eval("MailingAddress.ZipCode") %>' /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Delivery Area</td>
                                                        <td>
                                                            <asp:Label ID="lblDeliveryArea" runat="server" Text='<%# Eval("MailingAddress.DeliveryArea.Name") %>' /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Delivery Charge</td>
                                                        <td>PHP
                                                            <asp:Label ID="lblDeliveryCharge" runat="server" Text='<%# float.Parse(Eval("MailingAddress.DeliveryArea.Price").ToString()).ToString("n2") %>' /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Processing Type</td>
                                                        <td>
                                                            <asp:Label ID="lblOrderType" runat="server" Text='<%# ((OrderType)Enum.Parse(typeof(OrderType), Eval("OrderType").ToString(), true)).GetDescription() %>' /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Date Due To Courier</td>
                                                        <td>WAT?</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Estimated Delivery Date</td>
                                                        <td>
                                                            <asp:Label ID="lblEstimatedDeliveryDate" runat="server" Text='<%# Convert.ToDateTime(Eval("EstimatedDeliveryDate")).ToString("d") %>' /></td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                            <asp:Repeater ID="repOrderItem" DataSource='<%# Eval("OrderItemList") %>' runat="server">
                                                <ItemTemplate>
                                                    <table class="table table-bordered">
                                                        <tr>
                                                            <td class="col-md-5">Document</td>
                                                            <td>
                                                                <asp:Label ID="lblDocumentName" runat="server" Text='<%# Eval("Document.Name") %>' /></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Cost</td>
                                                            <td>
                                                                <asp:Label ID="lblCost" runat="server" Text='<%# (OrderType)Enum.Parse(typeof(OrderType), Eval("OrderType").ToString(), true) == OrderType.Regular ? Eval("Document.RegularPrice") : Eval("Document.ExpressPrice") %>' /></td>
                                                        </tr>
                                                        <tr>
                                                            <td>No. of Copies</td>
                                                            <td>
                                                                <asp:Label ID="lblNoOfCopes" runat="server" Text='<%# Eval("NoOfCopies") %>' /></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Envelope</td>
                                                            <td>
                                                                <asp:Label ID="lblEnvelope" runat="server" Text='<%# ((PackagingEnum)Enum.Parse(typeof(PackagingEnum), Eval("Packaging").ToString(), true)).GetDescription() %>' /></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Sub Total</td>
                                                            <td>PHP
                                                                <asp:Label ID="lblSubTotal" runat="server" Text='<%# int.Parse(Eval("NoOfCopies").ToString()) * ((OrderType)Enum.Parse(typeof(OrderType), Eval("OrderType").ToString(), true) == OrderType.Regular ? float.Parse(Eval("Document.RegularPrice").ToString()) : float.Parse(Eval("Document.ExpressPrice").ToString())) %>' /></td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <%--            Only display "mark as pending" and "mark as done" when currentorder is processing and NOT pending already--%>
                            <div class="content_buttons">
                                <%--<button id="btnBack" class="btn btn-primary">Back</button>--%>
                                
                                <asp:Button ID="btnMarkPending" CssClass="btn btn-warning" Text="Mark as Pending" runat="server" />
                                <asp:Button ID="btnMarkDone" CssClass="btn btn-success" Text="Mark as Done" runat="server" />
                                <asp:Button ID="btnMarkProcessing" CssClass="btn btn-default" Text="Mark as Processing" runat="server" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script src="/Script/admin_main.js"></script>
</asp:Content>