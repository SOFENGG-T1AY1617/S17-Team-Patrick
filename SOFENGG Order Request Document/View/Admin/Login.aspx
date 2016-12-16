<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Online Request for Documents</title>
    <link href="../../Content/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/css/admin_login.css" rel="stylesheet" />
    <script src="/Script/jquery.min.js"></script>
    <script src="/Script/jquery.validate.min.js"></script>
    <link href="/Content/css/loading.css" rel="stylesheet" />
</head>
<body>
    <form id="formMain" runat="server">
        <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="jumbotron">
                        <img src="../../Content/images/dlsu_logo.png" class="center-block login_image" />
                        <h4 class="text-center">Request of Document</h4>
                        <div class="form-horizontal">
                            <fieldset>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <asp:TextBox CssClass="form-control" ID="txtEmail" placeholder="Email" runat="server"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-12">
                                        <asp:TextBox CssClass="form-control" ID="txtPassword" placeholder="Password" TextMode="Password" runat="server"/>
                                    </div>
                                </div>

                                <button id="btnLogin" class="btn btn-default btn-block">Log in</button>
                            </fieldset>
                        </div>
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
    </form>

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

            var validator = $("#formMain")
                .validate({
                    onfocusout: false,
                    onkeyup: false,
                    onclick: false,
                    rules: {
                        <%=txtEmail.UniqueID %>:
                        {
                            required: true,
                            remote: function () {
                                return {
                                    url: '<%= ResolveUrl("LoginService.asmx/Login") %>', //URL of asmx file.                                 
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    data: JSON.stringify({ email: $('#<%=txtEmail.ClientID%>').val(), password: $('#<%=txtPassword.ClientID%>').val()}),
                                    dataFilter: function (data) {
                                        var msg = JSON.parse(data);
                                        if (msg.hasOwnProperty('d'))
                                            return msg.d;
                                        else
                                            return msg;
                                    }
                                }
                            }
                        },
                        <%=txtPassword.UniqueID %>:
                        {
                            required: true
                        }
                    },
                    messages: {
                        <%=txtEmail.UniqueID %>:
                        {
                            required: "Please enter your email.",
                            remote: "Invalid username or password"
                        },
                        <%=txtPassword.UniqueID %>:
                        {
                            required: "Please enter your password."
                        }

                    },
                    highlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
                    },
                    success: removeError,
                    
                    submitHandler: function(form) {
                        console.log("hi poh");
                        __doPostBack("cmdLogin");
                    }
                });

            function removeError(element) {
                //                        element.text('OK!').addClass('valid')
                //                            .closest('.form-group').removeClass('has-error').addClass('has-success');
                element
                    .closest('.form-group')
                    .removeClass('has-error');
            }

        });

        function pageLoad(sender, args) {

            this.__EVENTTARGET.value = "";
            this.__EVENTARGUMENT.value = "";
//
//            $("#btnLogin").click(function (evt) {
//                // Validate the form and retain the result.
//                var isValid = $("#formMain").valid();
//                console.log("isValid = " + isValid);
//                // If the form didn't validate, prevent the
//                //  form submission.
//                
//                console.log(isValid);
//                if (!isValid) {
//                    evt.preventDefault();
//                    return;
//                }
//
////                __doPostBack("cmdLoginUser");
//            });
        }

        jQuery(function ($) {
            $(document).ajaxStop(function () {
                $(".loader").hide();
            });
            $(document).ajaxStart(function () {
                $(".loader").show();
            });
        });
    </script>
</body>
</html>