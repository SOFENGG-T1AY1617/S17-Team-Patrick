<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DocumentList.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Admin.DocumentList" %>

<%@ Import Namespace="System.ComponentModel" %>
<%@ Import Namespace="SOFENGG_Order_Request_Document.Model" %>
<%@ Import Namespace="SOFENGG_Order_Request_Document.Model.Helper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Content/css/admin_document_list.css">
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="sm" runat="server">
    </asp:ScriptManager>

    <div class="jumbotron">
        <h2>Document List</h2>
    </div>

    <input type="button" id="add_document_modal" class="btn btn-success" data-toggle="modal" data-target="#dlgAddDocument" value="Add Document" />

    <div class="content-main table-responsive">
        <div class="document_table">
            <asp:UpdatePanel ID="upDocumentList" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:TextBox ID="cmdUpDocumentList" runat="server" type="hidden"></asp:TextBox>
                    <asp:GridView ID="gvDocuments" AutoGenerateColumns="False" runat="server" CssClass="table table-bordered table-hover table-fluid" GridLines="Vertical" >
                        <Columns>
                            <asp:BoundField DataField="Id" ReadOnly="True" ItemStyle-CssClass="hide" HeaderStyle-CssClass="hide" />
                            <asp:TemplateField HeaderText="Document Name">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Bind("Name") %>' ID="lbName"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Category">
                                <ItemTemplate>
                                    <asp:Label CcsClass="text-left" ID="lblCategory" runat="server" Text='<%#((DocumentCategoryEnum)Eval("Category")).GetDescription() %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Regular Price">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# float.Parse(Eval("RegularPrice").ToString()) == 0f ? "N/A" : float.Parse(Eval("RegularPrice").ToString()).ToString("n2") %>' ID="lbRegularPrice"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Express Price">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# float.Parse(Eval("ExpressPrice").ToString()) == 0f ? "N/A" : float.Parse(Eval("ExpressPrice").ToString()).ToString("n2") %>' ID="lbExpressPrice"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Weight">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Bind("Weight") %>' ID="lbWeight"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Maximum Copy">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Bind("MaxCopy") %>' ID="lblMaxCopy"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="For Undergraduate">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# bool.Parse(Eval("IsForUndergraduate").ToString()) ? "Yes" : "No" %>' ID="lblForUndergraduate"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="For Graduate">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# bool.Parse(Eval("IsForGraduate").ToString()) ? "Yes" : "No" %>' ID="lblForGraduate"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <button id="edit_document_modal" class="btnEditItem glypicon glyphicon-pencil" name="<%# Eval("Id") %>" data-toggle="modal" data-target="#dlgEditDocument" value="Edit"></button>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <button id="delete_document_modal" class="btnDeleteItem glyphicon glyphicon-trash" name="<%# Eval("Id") %>" data-toggle="modal" data-target="#dlgDeleteDocument" value="Delete"></button>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
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
<asp:Content ID="Content3" ContentPlaceHolderID="edit" runat="server">
    <div class="modal fade" id="dlgEditDocument" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="text-center">Edit Document</h3>
                </div>
                <asp:UpdatePanel ID="upEditDocument" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="cmdUpEditDocument" runat="server" type="hidden"></asp:TextBox>
                        <asp:TextBox ID="lblEditDocumentType" runat="server" type="hidden"></asp:TextBox>
                        <div class="modal-body">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="txtEditName" class="col-sm-5 control-label">Document Name</label>
                                    <div class="col-sm-5">
                                        <asp:TextBox ID="txtEditName" class="form-control" type="text" placeholder="Document Name" runat="server" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="txtEditRegularPrice" class="col-sm-5 control-label">Regular Charge</label>
                                    <div class="col-sm-5">
                                        <asp:TextBox ID="txtEditRegularPrice" class="form-control" type="text" placeholder="Price" runat="server" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="txtEditExpressPrice" class="col-sm-5 control-label">Express Charge</label>
                                    <div class="col-sm-5">
                                        <asp:TextBox ID="txtEditExpressPrice" class="form-control express_charge" type="text" placeholder="Price" runat="server" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="txtEditWeight" class="col-sm-5 control-label">Weight</label>
                                    <div class="col-sm-5">
                                        <asp:TextBox ID="txtEditWeight" class="form-control express_charge" type="text" placeholder="Weight" runat="server" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="txtEditMaxCopies" class="col-sm-5 control-label">Maximum Copies</label>
                                    <div class="col-sm-5">
                                        <asp:TextBox ID="txtEditMaxCopies" class="form-control express_charge" type="text" placeholder="Max Copies" runat="server" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-5 col-sm-7">
                                        <div class="checkbox">
                                            <label>
                                                <asp:CheckBox ID="cbEditForUndergraduate" runat="server" CcsClass="checkbox" />
                                                <asp:Label runat="server" Text="For Undergraduate"></asp:Label>
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <asp:CheckBox ID="cbEditForGraduate" runat="server" CcsClass="checkbox" />
                                                <asp:Label runat="server" Text="For Graduate"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="upDlgEditDocumentButtons" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <div class="modal-footer">
                            <div class="popup_center_align">
                                <button id="btnEdit" class="btn btn-success">Submit Edit</button>
                                <button id="btnEditCancel" class="btn" data-dismiss="modal">Cancel</button>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="other" runat="server">
    <div class="modal fade" id="dlgAddDocument" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="text-center">Add Document</h3>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="txtName" class="col-sm-5 control-label">Document Name</label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txtName" class="form-control" type="text" placeholder="Document Name" runat="server" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="txtRegularPrice" class="col-sm-5 control-label">Regular Charge</label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txtRegularPrice" class="form-control" type="text" placeholder="Price" runat="server" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="txtExpressPrice" class="col-sm-5 control-label">Express Charge</label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txtExpressPrice" class="form-control express_charge" type="text" placeholder="Price" runat="server" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="txtWeight" class="col-sm-5 control-label">Weight</label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txtWeight" class="form-control express_charge" type="text" placeholder="Weight" runat="server" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="txtMaxCopies" class="col-sm-5 control-label">Maximum Copies</label>
                            <div class="col-sm-5">
                                <asp:TextBox ID="txtMaxCopies" class="form-control express_charge" type="text" placeholder="Max Copies" runat="server" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-5 col-sm-7">
                                <div class="checkbox">
                                    <label>
                                        <asp:CheckBox ID="cbForUndergraduate" runat="server" CcsClass="checkbox" />
                                        <asp:Label runat="server" Text="For Undergraduate"></asp:Label>
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <asp:CheckBox ID="cbForGraduate" runat="server" CcsClass="checkbox" />
                                        <asp:Label runat="server" Text="For Graduate"></asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:UpdatePanel ID="upDlgAddDocument" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
                            <div class="popup_center_align">
                                <asp:Button ID="btnAdd" CssClass="btn btn-success btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" />
                                <button id="btnAddCancel" class="btn" data-dismiss="modal">Cancel</button>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="delete" runat="server">
    <div class="modal fade" id="dlgDeleteDocument" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content text-center">
                <div class="modal-header">
                    <h3>Are you sure you want to delete this document?</h3>
                </div>
                <asp:UpdatePanel ID="upDlgDeleteDocumentButtons" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">
                            <button id="btnDeleteYes" class="btn btn-danger">Yes</button>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="btn" data-dismiss="modal">No</button>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script src="/Script/admin_document_list.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

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

            // Group checkboxes
            $("#<%=cbForGraduate.ClientID %>").attr('name', 'addOrderAvailability[]');
            $("#<%=cbForUndergraduate.ClientID %>").attr('name', 'addOrderAvailability[]');
            $("#<%=cbEditForGraduate.ClientID %>").attr('name', 'editOrderAvailability[]');
            $("#<%=cbEditForUndergraduate.ClientID %>").attr('name', 'editOrderAvailability[]');

            $.validator.addMethod('nonZero', function (value, element, param) {
                return value > 0;
            });

            var validator = $("#formMain")
                .validate({
                    rules: {
                        // Add

                        <%=txtName.UniqueID %>: {
                            required: true

                        },
                        <%=txtRegularPrice.UniqueID %>: {
                            required: function(element) {;

                                var control = $("#<%=txtExpressPrice.ClientID %>");
                                var isRequired = control.val().length <= 0 || parseFloat(control.val(), 10) === 0;

                                if (!isRequired) {
                                    removeError(control);
                                    removeError($("#<%=txtRegularPrice.ClientID %>"));
                                }

                                return isRequired;
                            }
                        },
                        <%=txtWeight.UniqueID %>: {
                            required: true,
                            range: [0, 2147483647],
                            nonZero: true
                        },
                        <%=txtMaxCopies.UniqueID %>: {
                            required: true,
                            digits: true,
                            range: [0, 2147483647]
                        },

                        "addOrderAvailability[]":
                        {
                            required: true,
                            minlength: 1
                        },

                        // Edit
                        <%=txtEditName.UniqueID %>: {
                            required: true

                        },
                        <%=txtEditRegularPrice.UniqueID %>: {
                            required: function(element) {;

                                var control = $("#<%=txtEditExpressPrice.ClientID %>");
                                var isRequired = control.val().length <= 0 || parseFloat(control.val(), 10) === 0;

                                if (!isRequired) {
                                    removeError(control);
                                    removeError($("#<%=txtEditRegularPrice.ClientID %>"));
                                }

                                return isRequired;
                            }
                        },
                        <%=txtEditWeight.UniqueID %>: {
                            required: true,
                            range: [0, 2147483647],
                            nonZero: true
                        },
                        <%=txtEditMaxCopies.UniqueID %>: {
                            required: true,
                            digits: true,
                            range: [0, 2147483647]
                        },

                        "editOrderAvailability[]":
                        {
                            required: true,
                            minlength: 1
                        }
                    },
                    messages: {
                        // Add
                        <%=txtName.UniqueID %>: {
                            required: "Please enter a document name"
                        },
                        <%=txtRegularPrice.UniqueID %>: {
                            required: "Please enter a regular price"
                        },
                        <%=txtWeight.UniqueID %>: {
                            required: "Please enter a weight",
                            nonZero: "The weight must be greater than zero"
                        },
                        <%=txtMaxCopies.UniqueID %>: {
                            required: "Please enter the # of max copy"
                        },
                        "addOrderAvailability[]": "Please select at least one type of document.",

                        // Edit
                        <%=txtEditName.UniqueID %>: {
                            required: "Please enter a document name"
                        },
                        <%=txtEditRegularPrice.UniqueID %>: {
                            required: "Please enter a regular price"
                        },
                        <%=txtEditWeight.UniqueID %>: {
                            required: "Please enter a weight",
                            nonZero: "The weight must be greater than zero"
                        },
                        <%=txtEditMaxCopies.UniqueID %>: {
                            required: "Please enter the # of max copy"
                        },
                        "editOrderAvailability[]": "Please select at least one type of document."
                    },
                    highlight: function(element) {
                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                    },
                    success: removeError,
                    errorPlacement: function( label, element ) {
                        if( element.attr( "type" ) === "checkbox" ) {
                            element.closest('.form-group').children('div').append( label ); // this would append the label after all your checkboxes/labels (so the error-label will be the last element in <div class="controls"> )
                        } else {
                            label.insertAfter( element ); // standard behaviour
                        }
                    }
                });

            // Empty modal controls
            $('#dlgAddDocument')
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

                        $('#dlgAddDocument').find('input:text').val('');
                        $('#dlgAddDocument').find('.form-group').addClass('valid')
                            .closest('.form-group').removeClass('has-error');
                        validator.resetForm();
                    });

            function removeError(element) {
                //                        element.text('OK!').addClass('valid')
                //                            .closest('.form-group').removeClass('has-error').addClass('has-success');
                element.addClass('valid')
                    .closest('.form-group')
                    .removeClass('has-error');
            }

            $("#<%=txtRegularPrice.ClientID %>").on("keypress keyup blur", onlyAllowFloat);
            $("#<%=txtExpressPrice.ClientID %>").on("keypress keyup blur", onlyAllowFloat);
            $("#<%=txtWeight.ClientID %>").on("keypress keyup blur", onlyAllowFloat);

            $("#<%=txtEditRegularPrice.ClientID %>").on("keypress keyup blur", onlyAllowFloat);
            $("#<%=txtEditExpressPrice.ClientID %>").on("keypress keyup blur", onlyAllowFloat);
            $("#<%=txtEditWeight.ClientID %>").on("keypress keyup blur", onlyAllowFloat);

        });

        function onlyAllowFloat(event) {
            //this.value = this.value.replace(/[^0-9\.]/g,'');
            $(this).val($(this).val().replace(/[^0-9\.]/g,''));
            if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
                event.preventDefault();
            }
        }

        function pageLoad(sender, args) {

            this.__EVENTTARGET.value = "";
            this.__EVENTARGUMENT.value = "";

            $(".btnAdd").click(function(evt) {
                // Validate the form and retain the result.
                var isValid = $("#formMain").valid();
                console.log("isValid = " + isValid);
                // If the form didn't validate, prevent the
                //  form submission.

                console.log(isValid);
                if (!isValid) {
                    evt.preventDefault();
                    return;
                }
                $('#dlgAddDocument').modal('hide');
            });

            $("#btnEdit").click(function(evt) {
                // Validate the form and retain the result.
                var isValid = $("#formMain").valid();
                console.log("isValid = " + isValid);
                // If the form didn't validate, prevent the
                //  form submission.

                console.log(isValid);
                if (!isValid)
                    return;

                $('#dlgEditDocument').modal('hide');

                var documentId = $(this).attr('name');
                __doPostBack('<%=upDlgEditDocumentButtons.ClientID%>', documentId);
            });

            $(".btnEditItem")
                .click(function(event) {
                    var documentId = $(this).attr('name');
                    $("#btnEdit").attr('name', documentId);
                    __doPostBack('<%=upDocumentList.ClientID%>', documentId);
                });

            $(".btnDeleteItem")
                .click(function(event) {
                    var documentId = $(this).attr('name');
                    $("#btnDeleteYes").attr('name', documentId);
                });

            $("#btnDeleteYes")
                .click(function(event) {
                    var documentId = $(this).attr('name');
                    __doPostBack('<%=upDlgDeleteDocumentButtons.ClientID%>', documentId);
                    $('#dlgDeleteDocument').modal('hide');

                    return false;
                });
        }

        jQuery(function ($){
            $(document).ajaxStop(function(){
                $(".loader").hide();
            });
            $(document).ajaxStart(function(){
                $(".loader").show();
            });
        });
    </script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js" type="text/javascript"></script>
</asp:Content>