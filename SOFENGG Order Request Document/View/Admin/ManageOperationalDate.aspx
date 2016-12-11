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
            <div class="col-md-8">
                <div class="alert alert-dismissible alert-danger">
                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                  <strong>These are the dates where the system will not be operational.</strong>
                </div>
                <div class="list-group">
                  <a href="#" class="list-group-item">December 30, 2016<input type="button" data-toggle="modal" data-target="#dlgRemoveDate" class="remove_date" value="Remove"/></a>
                  <a href="#" class="list-group-item">January 1, 2017<input type="button" data-toggle="modal" data-target="#dlgRemoveDate" class="remove_date" value="Remove"/></a>
                  <a href="#" class="list-group-item">January 2, 2017<input type="button" data-toggle="modal" data-target="#dlgRemoveDate" class="remove_date" value="Remove"/></a>
                  <a href="#" class="list-group-item">December 30, 2016<input type="button" data-toggle="modal" data-target="#dlgRemoveDate" class="remove_date" value="Remove"/></a>
                  <a href="#" class="list-group-item">January 1, 2017<input type="button" data-toggle="modal" data-target="#dlgRemoveDate" class="remove_date" value="Remove"/></a>
                  <a href="#" class="list-group-item">January 2, 2017<input type="button" data-toggle="modal" data-target="#dlgRemoveDate" class="remove_date" value="Remove"/></a>
                  <a href="#" class="list-group-item">December 30, 2016<input type="button" data-toggle="modal" data-target="#dlgRemoveDate" class="remove_date" value="Remove"/></a>
                  <a href="#" class="list-group-item">January 1, 2017<input type="button" data-toggle="modal" data-target="#dlgRemoveDate" class="remove_date" value="Remove"/></a>
                  <a href="#" class="list-group-item">January 2, 2017<input type="button" data-toggle="modal" data-target="#dlgRemoveDate" class="remove_date" value="Remove"/></a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="date_picker">

                </div>

                <div class="panel panel-primary date_information">
                  <div class="panel-heading">
                    <h3 class="panel-title">Date to add</h3>
                  </div>
                  <div class="panel-body text-center">
                    <h4 class="show_date_picker"></h4>
                  </div>
                </div>

                <button class="btn btn-primary">Add</button>
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
                    <button class="btn btn-primary">Yes</button>
                    <button class="btn btn-primary">No</button>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js" type="text/javascript"></script>
    <script>
    $(function() {
        $(".date_picker").datepicker();
        $(".show_date_picker").html($.datepicker.formatDate("MM dd, yy", $(".date_picker").datepicker('getDate')));
    });

    


    $(".date_picker").datepicker({
        onSelect: function (dateText) {
            $(".show_date_picker").html($.datepicker.formatDate("MM dd, yy", $(".date_picker").datepicker('getDate')));
        }
    });
    </script>
</asp:Content>