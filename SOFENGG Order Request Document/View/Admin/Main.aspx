<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Admin.Main" %>

<%@ Import Namespace="SOFENGG_Order_Request_Document.Model" %>
<%@ Import Namespace="SOFENGG_Order_Request_Document.Model.Helper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Content/css/admin_main.css">
    <link href="../../Content/css/admin_order_information.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="sm" runat="server" EnablePageMethods="true" EnablePartialRendering="true"></asp:ScriptManager>

    <div class="content-main table-responsive">
        <div class="container">
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
                                <h4><span class="glyphicon glyphicon-ok">&nbsp;</span>On Time: <b>
                                    <asp:Label ID="lblOnTimeCount" runat="server" /></b></h4>
                            </td>
                            <td class="danger">
                                <h4><span class="glyphicon glyphicon-remove">&nbsp;</span>Late: <b>
                                    <asp:Label ID="lblLateCount" runat="server" /></b></h4>
                            </td>
                            <td>
                                <h4>Total Quantity: <b>
                                    <asp:Label ID="lblTotalCount" runat="server" /></b></h4>
                            </td>
                        </tr>
                    </table>
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
            </div>
        </div>
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

                                <asp:Button ID="btnMarkPending" CssClass="btn btn-warning" data-toggle="modal" data-target="#dlgPending" runat="server" Text="Mark as Pending" />
                                <asp:Button ID="btnMarkDone" CssClass="btn btn-success" Text="Mark as Done" runat="server" />
                                <asp:Button ID="btnMarkProcessing" CssClass="btn btn-default" Text="Mark as Processing" runat="server" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="modal fade" id="dlgPending" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4>Reference Number <asp:Label ID="lblPendingReferenceNo" runat="server"></asp:Label></h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="txtPendingReason" class="col-sm-3 control-label">Reason For Delay</label>
                            <div class="col-sm-7">
                            <asp:TextBox ID="txtPendingReason" TextMode="MultiLine" runat="server" class="form-control"/>
                            </div>
                            <asp:RequiredFieldValidator ControlToValidate="txtPendingReason" runat="server" ErrorMessage="Reason for pending cannot be blank." ValidationGroup="vgPending"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="txtNewDueDate" class="col-sm-3 control-label">New Due Date</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtNewDueDate" CssClass="txtNewDueDate form-control" runat="server" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ControlToValidate="txtNewDueDate" runat="server" ValidationGroup="vgPending" ErrorMessage="Please set a new due date." Display="dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ControlToValidate="txtNewDueDate" ErrorMessage="Invalid format of date. Use MM/DD/YYYY format." runat="server" ValidationExpression="^([0-9]|0[1-9]|1[012])\/([0-9]|0[1-9]|[12][0-9]|3[01])\/(19|20)\d\d$" ValidationGroup="vgPending" Display="dynamic"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnMarkAsPending" ValidationGroup="vgPending" class="btn btn-primary" runat="server" Text="Mark As Pending" OnClick="btnMarkAsPending_OnClick" />
                    <button id="btnPendingCancel" type="button" class="btn btn-default" data-dismiss="modal">
                        Cancel</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script src="/Script/admin_main.js"></script>

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_initializeRequest(InitializeRequest);
            prm.add_endRequest(EndRequest);
            // Place here the first init of the DatePicker

            $('.txtNewDueDate').datepicker();

        });

        function InitializeRequest(sender, args) { }
        function EndRequest(sender, args) {
            // after update occur on UpdatePanel re-init the DatePicker

            $('.txtNewDueDate').datepicker();

        }
    </script>
</asp:Content>