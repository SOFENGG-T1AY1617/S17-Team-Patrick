<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="../../Content/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/css/admin_login.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="jumbotron">
                    <img src="../../Content/images/dlsu_logo.png" class="center-block login_image"/>
                    <h4 class="text-center">Request of Document</h4>
                    <div class="form-horizontal">
                        <fieldset>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="text" class="form-control" id="txtUsername" placeholder="Username" />
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="password" class="form-control" id="txtPassword" placeholder="Password" />
                                </div>
                            </div>

                            <button class="btn btn-default btn-block">Log in</button>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
