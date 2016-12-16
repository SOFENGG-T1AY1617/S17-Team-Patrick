<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageOperationalDate.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Admin.ManageOperationalDate" %>

<%@ Import Namespace="System.ComponentModel" %>
<%@ Import Namespace="SOFENGG_Order_Request_Document.Model" %>
<%@ Import Namespace="SOFENGG_Order_Request_Document.Model.Helper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/css/admin_manage_operational_date.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="sm" runat="server" EnablePageMethods="true" EnablePartialRendering="true"></asp:ScriptManager>

    <div class="jumbotron">
        <h2>Offline Dates</h2>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-3 col-md-offset-1">
                <div class="date_picker">
                </div>

                <div class="panel panel-success date_information">
                    <div class="panel-heading">
                        <h3 class="panel-title">Date to add</h3>
                    </div>
                    <div class="panel-body text-center">
                        <h4 class="show_date_picker" />
                    </div>
                </div>

                <asp:UpdatePanel ID="upAddButton" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <button id="btnAdd" class="btn btn-success">Add</button>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col-md-7">
                <div class="alert alert-dismissible alert-danger">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>These are the dates where the system will not be operational.</strong>
                </div>
                <asp:UpdatePanel ID="upOfflineDates" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="cmdUpOfflineDates" runat="server" type="hidden"></asp:TextBox>
                        <div class="list-group">
                            <asp:Repeater ID="repOfflineDates" runat="server">
                                <ItemTemplate>
                                    <a href="#" class="list-group-item">
                                        <div class="row">
                                        <div class="col-md-1">
                                            <span class="label label-<%# IsWeekend((DateTime) Eval("Date")) ? "default" : "success" %>"><%# string.Format("{0:ddd}", Eval("Date")).ToUpper() %></span>
                                        </div>
                                        <div class="col-md-11">
                                            <%# string.Format("{0:MMMM dd, yyyy}", Eval("Date")) %>
                                            <input id="<%# string.Format("{0:yyyy-MM-dd}", Eval("Date")) %>" type="button" data-toggle="modal" data-target="#dlgRemoveDate" class="remove_date btnRemove" value="Remove" />
                                        </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <p style="float: right;" class="text-muted">(Added by <%# string.Format("{0} {1}", Eval("Personel.FirstName"), Eval("Personel.LastName")) %>)</p>
                                            </div>
                                        </div>
                                    </a>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="delete" runat="server">
    <div class="modal fade" id="dlgRemoveDate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content text-center">
                <div class="modal-header">
                    <h3>Remove Date?</h3>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="upDeleteYesButton" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
                            <button id="btnDeleteYes" class="btn btn-primary">Yes</button>
                            <button class="btn btn-primary" data-dismiss="modal">No</button>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>

    <div id="loading">
        <div class="loader" style="position: fixed; left: 50%; top: 50%;">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js" type="text/javascript"></script>
    <script>

        $(document)
            .ready(function () {

                // Postback
                $("#loading").hide();

                // dlgOrderInformation Loading Events
                var prm = Sys.WebForms.PageRequestManager.getInstance();

                function clearPostBack() {

                    $("#loading").hide();

                    prm.remove_endRequest(clearPostBack);
                }

                prm.add_beginRequest(
                    function (sender, args) {

                        $("#loading").show();

                        prm.add_endRequest(clearPostBack);

                    });

                $('.date_picker').datepicker(
                {
                    minDate: '<%= DateTime.Now.ToShortDateString() %>',
                    changeMonth: true,
                    changeYear: true,
                    onSelect: function (dateText) {
                        $(".show_date_picker").html($.datepicker.formatDate("MM dd, yy", $(".date_picker").datepicker('getDate')));
                    }
                });
            });

                function pageLoad(sender, args) {

                    this.__EVENTTARGET.value = "";
                    this.__EVENTARGUMENT.value = "";

                    $("#btnAdd").click(function (evt) {
                        var date = $(".show_date_picker").html();
                        __doPostBack('<%=upAddButton.ClientID%>', date);
            });

            $(".btnRemove").click(function (evt) {
                $("#btnDeleteYes").attr('name', $(this).attr('id'));
            });

            $("#btnDeleteYes").click(function (evt) {
                var date = $(this).attr('name');
                __doPostBack('<%=upDeleteYesButton.ClientID%>', date);

                $('#dlgRemoveDate').modal('hide');
            });
        }

        jQuery(function ($) {
            $(document).ajaxStop(function () {
                $(".loader").hide();
            });
            $(document).ajaxStart(function () {
                $(".loader").show();
            });
        });

        $(function () {
            $(".date_picker").datepicker();
            $(".show_date_picker").html($.datepicker.formatDate("MM dd, yy", $(".date_picker").datepicker('getDate')));
        });
    </script>
</asp:Content>