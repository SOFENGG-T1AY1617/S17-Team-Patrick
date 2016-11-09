<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DocumentList.aspx.cs" Inherits="SOFENGG_Order_Request_Document.Admin.DocumentList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Content/css/admin_document_list.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container content">
      <div class="row">
        <div class="col-xs-2 content-sidebar">
          <h3>Menu</h3>
          <br>
          <ul>
            <li><a href="admin_main.html">Home</a></li>
            <li><b>Maintain Document List</b></li>
            <li>Update Operational Date</li>
          </ul>
          <br>
          <ul>
            <li>Current Orders</li>
            <li>Pending Orders</li>
            <li>Cancelled Orders</li>
            <li>Previous Orders</li>
          </ul>
        </div>
        <div class="col-xs-9 col-xs-offset-1 content-main">
            <div>
                <h1>Order Number <%= CurrentOrder.ReferenceNo %></h1>
                
                <%--Table that shows user details--%>
                <table>
                    <tr>
                        <td colspan="2">Transaction Details</td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><%= User.Name %></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><%= User.address %></td>
                    </tr>
                    <tr>
                        <td>Phone Number</td>
                        <td><%= User.phoneNumber %></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><%= User.Email %></td>
                    </tr>
                    <tr>
                        <td>Place of Birth</td>
                        <td><%= User.placeOfBirth %></td>
                    </tr>
                </table>
                
                <%--Table that shows delivery details, together with the documents with it--%>
                <asp:Repeater runat="server" ID="deliveryDetailsTable" SelectMethod="deliveryDetailsTable_GetData">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td colspan="2">Delivery Details</td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>Mailing Address</td>
                            <td><%= Order.address %></td>
                        </tr>
                        <tr>
                            <td>Delivery Area</td>
                            <td><%= Order.deliveryArea %></td>
                        </tr>
                        <tr>
                            <td>Delivery Charge</td>
                            <td><%= Order.price %></td>
                        </tr>
                        <tr>
                            <td>Processing Type</td>
                            <td><%= Order.processingType %></td>
                        </tr>
                        <tr>
                            <td>Date Due To Courier</td>
                            <td><%= Order.dateDueCourier %></td>
                        </tr>
                        <tr>
                            <td>Estimated Delivery Date</td>
                            <td><%= Order.dateDueEstimated %></td>
                        </tr>
                        <asp:Repeater runat="server" ID="documentsPerMailingAddressTable" SelectMethod="documentsPerMailingAddressTable_GetData">
                            <ItemTemplate>
                                <tr>
                                    <td>Document</td>
                                    <td><%= documentOrdered.name %></td>
                                </tr>
                                <tr>
                                    <td>Degree</td>
                                    <td><%= documentOrdered.degree %></td>
                                </tr>
                                <tr>
                                    <td>Cost</td>
                                    <td><%= documentOrdered.cost %></td>
                                </tr>
                                <tr>
                                    <td>No. of Copies</td>
                                    <td><%= documentOrdered.numberOfCopies %></td>
                                </tr>
                                <tr>
                                    <td>Sub Total</td>
                                    <td><%= documentOrdered.subTotal %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>

            </div>
            <div>
                <table>
                    <tr>
                        <td colspan="2" class="content-form_label" align="center">Amount Due</td>
                    </tr>
                    <tr>
                        <td>Total Delivery Cost</td>
                        <td><%= CurrentOrder.totalDeliveryCost %></td>
                    </tr>
                    <tr>
                        <td>Total Document Cost</td>
                        <td><%= CurrentOrder.totalDocumentCost %></td>
                    </tr>
                    <tr>
                        <td>Total Cost</td>
                        <td><%= CurrentOrder.totalCost %></td>
                    </tr>
                </table>
            </div>
<%--            Only display "mark as pending" and "mark as done" when currentorder is processing and NOT pending already--%>
            <div>
                <button class="btn btn-primary">Back</button>
                <% if(CurrentOrder.status == "processing") {%>
                <button class="btn btn-danger">Mark as Pending</button>
                <button class="btn btn-success">Mark as Done</button>
                <% } else { %>
                <button class="btn btn-warning">Mark as Processing</button>
                <% } %>
            </div>
        </div>
      </div>
    </div>
</asp:Content>