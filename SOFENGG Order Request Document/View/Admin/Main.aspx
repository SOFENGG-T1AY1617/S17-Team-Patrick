<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Admin.Master" AutoEventWireup="True" CodeBehind="Main.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Admin.Main" %>

<%@ Import Namespace="SOFENGG_Order_Request_Document.Model" %>
<%@ Import Namespace="SOFENGG_Order_Request_Document.Model.Helper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Content/css/admin_main.css">
    <link href="../../Content/css/admin_order_information.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="sm" runat="server" EnablePageMethods="true" EnablePartialRendering="true"></asp:ScriptManager>

    <div class="jumbotron">
        <h2>Current Orders</h2>

        <div class="container">
            <div class="row">
                <div class="col-md-offset-3">
                    <asp:UpdatePanel ID="upStatus" ChildrenAsTriggers="False" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                             <ul class="nav nav-tabs justified">
                                <li><a href="#">Processing: <span class="badge">
                                    <asp:Label ID="lblProcessingCount" runat="server" /></span></a></li>
                                <li><a href="#">Pending: <span class="badge">
                                    <asp:Label ID="lblPendingCount" runat="server" /></span></a></li>
                                <li><a href="#">On Time: <span class="badge">
                                    <asp:Label ID="lblOnTimeCount" runat="server" /></span></a></li>
                                <li><a href="#">Late: <span class="badge">
                                    <asp:Label ID="lblLateCount" runat="server" /></span></a></li>
                                <li><a href="#">Total Quantity: <span class="badge">
                                    <asp:Label ID="lblTotalCount" runat="server" /></span></a></li>
                            </ul>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>

    <div class="content-main table-responsive">
        <div class="main_report">

            <asp:UpdatePanel ID="upOrderList" ChildrenAsTriggers="True" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Repeater ID="repOrders" runat="server">
                        <HeaderTemplate>
                            <table class="table table-hover table-bordered table-fluid">
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
                                <td class="text-left">
                                    <asp:Label ID="lblReferenceNo" runat="server" Text='<%# Eval("ReferenceNo") %>' />
                                </td>
                                <td class="text-left">
                                    <asp:Label ID="lblTransactionDate" runat="server" Text='<%# Eval("TransactionDate") %>' />
                                </td>
                                <td class="text-left">
                                    <asp:Label ID="lblDueDate" runat="server" Text='<%# Convert.ToDateTime(Eval("DueDate")).ToString("d") %>' />
                                </td>
                                <td class="text-left">
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# ((OrderStatusEnum) Eval("OrderStatus")).GetDescription() %>' />
                                </td>
                                <td class="text-left">
                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Receiver.FirstName") + " " + (!string.IsNullOrEmpty(Eval("Receiver.MiddleName").ToString()) ? Eval("Receiver.MiddleName") + " " : "") + Eval("Receiver.LastName") %>' />
                                </td>
                                <td class="text-right">
                                    <asp:Label ID="lblAmount" runat="server" Text='<%# float.Parse(Eval("TotalAmount").ToString()).ToString("n2") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                    </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="other" runat="server">

    <div class="modal fade" id="dlgOrderInformation" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upOrderInformation" ChildrenAsTriggers="True" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <input type="hidden" id="cmdUpdateOrderInformation" />
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h6>Reference Number
                                <asp:Label ID="lblActiveReferenceNo" runat="server"></asp:Label></h6>
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
                                                <asp:Label ID="lblActiveOrderAddress" runat="server" />
                                            </td>
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
                                <asp:Label ID="lblActiveTransactionDate" style="display: none;" CssClass="lblActiveTransactionDate" runat="server" />

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
                                                        <td></td>
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

                                <asp:UpdatePanel ID="upOrderInformationButtons" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="btnMarkPending" CssClass="btn btn-warning" data-toggle="modal" data-target="#dlgPending" runat="server" Text="Mark as Pending" />
                                        <asp:Button ID="btnMarkDone" CssClass="btn btn-success" Text="Mark as Done" runat="server" OnClick="btnMarkDone_OnClick" />
                                        <asp:Button ID="btnMarkProcessing" CssClass="btn btn-default" Text="Mark as Processing" runat="server" OnClick="btnMarkProcessing_OnClick" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnMarkAsPending" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
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
                    <h6>Mark as Pending</h6>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="txtPendingReason" class="col-sm-3 control-label">Reason For Delay</label>
                            <div class="col-sm-7">
                                <asp:TextBox ID="txtPendingReason" MaxLength="200" TextMode="MultiLine" runat="server" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="txtNewDueDate" class="col-sm-3 control-label">New Due Date</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtNewDueDate" CssClass="txtNewDueDate form-control" runat="server" Width="150px"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:UpdatePanel ID="upDlgPending" ChildrenAsTriggers="False" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="modal-footer">
                            <asp:Button ID="btnMarkAsPending" class="btn btn-success" runat="server" Text="Mark As Pending" OnClientClick="$('#dlgPending').modal('hide');" OnClick="btnMarkAsPending_OnClick" data-dismiss="modal" />
                            <button id="btnPendingCancel" type="button" class="btn btn-default" data-dismiss="modal">
                                Cancel</button>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script src="/Script/admin_main.js"></script>

    <link rel="stylesheet" href="/Content/css/jquery-ui.css" />
    <script src="/Script/jquery-ui.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#dlgPending")
                .on('shown.bs.modal', function (e) {
                    $("#dlgOrderInformation").modal('hide');

                    var prm = Sys.WebForms.PageRequestManager.getInstance();
                    prm.add_initializeRequest(InitializeRequest);
                    prm.add_endRequest(EndRequest);
                    // Place here the first init of the DatePicker

                    $('.txtNewDueDate').datepicker(
                    {
                        showButtonPanel: true,
                        minDate: getMinimumNewDueDate($('#<%=lblActiveTransactionDate.ClientID %>').text()),
                        changeMonth: true,
                        changeYear: true
                    });
                });
        });

            function InitializeRequest(sender, args) { }
            function EndRequest(sender, args) {
                // after update occur on UpdatePanel re-init the DatePicker

                var minDate = getMinimumNewDueDate($('#<%=lblActiveTransactionDate.ClientID %>').text());
                $(".txtNewDueDate").datepicker("option", "minDate", minDate).datepicker("setDate", new Date());

            }

            function getMinimumNewDueDate(transactionDate) {
                return new Date(new Date(transactionDate).valueOf() + 1000 * 3600 * 24);
            }
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            // Rule: Greater Than
            jQuery.validator.addMethod("greaterThan",
            function(value, element, params) {

                console.log("Current Date = " + value);
                console.log("Start Date Element Name = " + params);
                console.log("Start Date = " + $(params).text());

                if (!/Invalid|NaN/.test(new Date(value))) {
                    return new Date(value) > new Date($(params).text());
                }

                return isNaN(value) && isNaN($(params).text())
                    || (Number(value) > Number($(params).text()));
            },'Must be greater than {0}.');

            // Rule: Date Format
            $.validator.addMethod("dateFormat", function(value, element, regexp) {
                return this.optional(element) || regexp.test(value);
            }, "Please enter a valid date.");

            // Set rules
            $("#formMain").validate({
                rules: {
                    //This section we need to place our custom rule
                    //for the control.
                    <%=txtPendingReason.UniqueID %>:{
                        required: true
                    },
                    <%=txtNewDueDate.UniqueID %>:{
                        required: true,
                        dateFormat: /^(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.](19|20)\d\d$/,
                        greaterThan: '.lblActiveTransactionDate'
                    },
                },
                messages: {
                    //This section we need to place our custom
                    //validation message for each control.
                    <%=txtPendingReason.UniqueID %>:{
                        required: "Please enter a reason for delay."
                    },
                    <%=txtNewDueDate.UniqueID %>:{
                        required: "Please enter a new due date.",
                        greaterThan: "New due date must be after the transaction date.",
                        dateFormat: "Please enter a valid date (MM/DD/YYYY)"
                    }
                },
                highlight: function (element) {
                    $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                },
                success: function (element) {
                    //element.text('OK!').addClass('valid')
                    //    .closest('.form-group').removeClass('has-error').addClass('has-success');
                    element.addClass('valid')
                        .closest('.form-group').removeClass('has-error');
                }
            });

            // Empty modal controls
            $('#dlgPending')
                .on('hidden.bs.modal',
                    function(e) {
                        $("#dlgOrderInformation").modal('show');
                        $(this)
                            .find("input,textarea,select").not(':submit')
                            .val('')
                            .end()
                            .find("input[type=checkbox], input[type=radio]")
                            .prop("checked", "")
                            .end();
                    });
        });
    </script>
</asp:Content>