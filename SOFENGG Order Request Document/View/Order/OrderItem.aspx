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
            <h5 class="content-header">Order Item</h5>

            <table border="1" class="content-form" align="center">
                <tbody>
                <tr>
                    <td valign="top" class="content-form_label">Document</td>
                    <td>&nbsp;<%#Eval("DocumentName") %></td>
                </tr>
                <tr>
                    <td class="content-form_label">Academic Profile</td>
                    <td>&nbsp;<%#Eval("AcademicProfile") %></td>
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
                                <td>&nbsp;<asp:CheckBox ID="cbPickup" runat="server"></asp:CheckBox>&nbsp;For Pick Up</td>
                                <td>
                                    <asp:DropDownList id="ddlCampus" runat="server">
                                        <asp:ListItem Text="DLSU-Manila" value="DLSU-Manila"/>
                                        <asp:ListItem Text="DLSU-STC" value="DLSU-STC"/>
                                        <asp:ListItem Text="DLSU-Makati" value="DLSU-Makati"/>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="padding: 8px;">
                                    <span style="font-weight: bold; font-style: italic;">"Express processing is NOT available for students with ID no. <br/>80XXXXX (students who entered DLSU-Manila in 1980) and below."</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="content-form_label">No. of Copies</td>
                    <td>&nbsp;<asp:TextBox ID="tbNoCopy" size="2" maxlength="2" runat="server" />
                               <br />
                                <asp:RequiredFieldValidator 
                                   id="rfvNoCopy" 
                                   runat="server" 
                                   ControlToValidate="tbNoCopy"
                                   ErrorMessage="No. of Copies is a required field" 
                                   ForeColor="Red"/>
                                <br />
                               <asp:CompareValidator 
                                   ID="cvNoCopy" 
                                   runat="server" 
                                   ControlToValidate="tbNoCopy" 
                                   Type="Integer"
                                   Operator="DataTypeCheck" 
                                   ErrorMessage="No. of Copies must be a whole number!"
                                   ForeColor="Red" />
                                <br />                      
                               <asp:RangeValidator
                                   id="rvNoCopy" 
                                   ControlToValidate="tbNoCopy" 
                                   MinimumValue="1"
                                   MaximumValue="9" 
                                   Type="Integer" 
                                   ErrorMessage="Minimum no. of copies is 1; Max number of copies is 99."
                                   ForeColor="Red"  
                                   runat="server" /> 

                    </td>
                </tr>
                <tr class="delivery_only">
                    <td class="content-form_label">Send to</td>
                    <td>&nbsp;<%#Eval("Address")%></td>
                </tr>
                <tr>
                    <td class="content-form_label">Insert Document In</td>
                    <td style="padding-left: 3px;">
                        <asp:RadioButtonList ID="optInsert" RepeatDirection="Vertical" RepeatLayout="Flow" runat="server">
                          <asp:ListItem Text="Brown Envelope" Value="1" onclick="alert('For a DLSU security sticker to be used for sealing the envelope, please message the following email address: hub@dlsu.edu.ph.');" ></asp:ListItem>
                          <asp:ListItem Text="White Envelope" Value="2" onclick="alert('For a DLSU security sticker to be used for sealing the envelope, please message the following email address: hub@dlsu.edu.ph.');"></asp:ListItem>
                          <asp:ListItem Text="None" Value="3"></asp:ListItem>
                          </asp:RadioButtonList> 
                       <br />
                        <asp:RequiredFieldValidator id="rfvInsert" runat="server" ControlToValidate="optInsert"
                        ErrorMessage="Insert into is a required field" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                </tbody>
            </table>
            <br/>
            <div style="text-align: center">
                 
                <asp:Button class="btn btn-primary" runat="server"  Text="Cancel"/>
                <asp:Button class="btn btn-primary" runat="server"  Text="Add to Cart"/>
                  
            </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">

    <script src="/Script/order_item.js"></script>

    <script runat ="server">
    </script>
</asp:Content>