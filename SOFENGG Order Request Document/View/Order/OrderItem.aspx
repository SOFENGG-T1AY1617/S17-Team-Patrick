<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="OrderItem.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.OrderItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Always change the css file name to html file name! -->
    <link rel="stylesheet" href="/Content/css/order_item.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="col-xs-3">
        <h5>Request Flow</h5>
        <ul>
            <li>
                <a href="personal_information.html">Personal Information</a>
            </li>
            <li>
                <a href="info_acad_de.html">Academic Information</a>
            </li>
            <li>
                <a href="info_mail_de.html">Mailing Information</a>
            </li>
            <li>
                <a href="document_list.html">Document List</a>
            </li>
            <li>
                <a href="info_transaction.html">Checkout</a>
            </li>
        </ul>
        <div class="content-divider"></div>
    </div>
    <div class="col-xs-9">
            <h5 class="content-header" class="content-form">Order Item</h5>

            <table border="1" class="content-form" align="center">
                <tbody>
                <tr>
                    <td valign="top" class="content-form_label">Document</td>
                    <td>&nbsp;<asp:Label runat="server"><%docname = Request.Cookies("DocumentName") response.write("DocumentName=" & docname) %></asp:Label></td>
                </tr>
                <tr>
                    <td class="content-form_label">Academic Profile</td>
                    <td>&nbsp;<asp:Label runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td class="content-form_label">Price</td>
                    <td>
                        <table class="priceTable" style="border: none; width: 100%; background-color: white;">
                            <tr>
                                <td>&nbsp;<asp:RadioButton ID="rbRegular" GroupName="optProc" runat="Server"></asp:RadioButton>&nbsp;Regular Processing</td>
                                <td>&nbsp;<%#Eval("RegularPrice") %></td>
                            </tr>
                            <tr>
                                <td>&nbsp;<asp:RadioButton ID="rbExpress" GroupName="optProc" runat="Server"></asp:RadioButton>&nbsp;Express Processing</td>
                                <td>&nbsp;<%#Eval("ExpressPrice") %></td>
                            </tr>
                            <tr>
                                <td>&nbsp;<asp:CheckBox ID="for_pickup" AutoPostBack="true" runat="server"></asp:CheckBox>&nbsp;For Pick Up</td>
                                <td>
                                    <asp:DropDownList id="ddlCampus" runat="server">
                                        <asp:ListItem Text="DLSU-Manila" value="DLSU-Manila"/>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="padding: 8px;">
                                    <span style="font-weight: bold; font-style: italic;">"Express processing is NOT available for students with ID no. <br>80XXXXX (students who entered DLSU-Manila in 1980) and below."</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="content-form_label">No. of Copies</td>
                    <td>&nbsp;<asp:TextBox ID="tbNoCopy" size="2" maxlength="2" runat="server"></asp:TextBox>
                               <asp:RequiredFieldValidator id="rfvNoCopy" runat="server" ControlToValidate="tbNoCopy"
                                   ErrorMessage="No. of Copies is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="delivery_only">
                    <td class="content-form_label">Send to</td>
                    <td>&nbsp;<asp:Label runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td class="content-form_label">Insert Document In</td>
                    <td>
                        &nbsp;
                        <asp:RadioButton ID="rbBrown" GroupName ="optInsert" runat="server" /> Brown Envelope
                        <asp:RadioButton ID="rbWhite" GroupName="optInsert" runat="server"/> White Envelope
                        <asp:RadioButton ID="rbNone" GroupName="optInsert" runat="server"/> None
                        <asp:RequiredFieldValidator id="rfvInsert" runat="server" ControlToValidate="optInsert"
                        ErrorMessage="Insert into is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                    
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" style="padding: 8px;">
                        <a href="document_list.html">
                            <asp:TextBox  value="Cancel" CssClass="btn btn-primary" runat="server"/>
                        </a>
                        <a href="info_transaction.html">
                            <asp:TextBox  value="Add to Cart" CssClass="btn btn-primary" runat="server"/>
                        </a>
                    </td>
                </tr>
                </tbody>
            </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">

    <script src="/Script/order_item.js"></script>

    <script runat ="server">
    </script>
</asp:Content>