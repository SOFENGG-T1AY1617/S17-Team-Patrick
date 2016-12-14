<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="OrderItem.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.OrderItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Always change the css file name to html file name! -->
    <link rel="stylesheet" href="/Content/css/order_item.css">

    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>

    <script>
        $(document).ready(function () {
                $('#<%=cbPickup.ClientID %>').click(function () {
                 if ($('#<%=cbPickup.ClientID %>').is(':checked')) {
                     $("#delivery_only1").hide();
                     $("#delivery_only2").hide();

                     $("#ddlCampus").css("display", "block");
                     $("#pCampus").css("display", "block");
                 }
                 else if ($('#<%=cbPickup.ClientID %>').is(':checked') == false) {
                     $("#delivery_only1").show();
                     $("#delivery_only2").show();

                     $("#ddlCampus").css("display", "none");
                     $("#pCampus").css("display", "none");
                 }
            });

           

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container-fluid center-block"> 
        <ul class="breadcrumb">
                &nbsp;
                <li><a href="#">Home</a></li>
                <li>
                    <a href="PersonalInformation.aspx">Personal Information</a>
                </li>
                <li>
                    <a href="InfoAcadDe.aspx">Academic Information</a>                              
                </li>
                <li>
                    <a href="InfoMailDe.aspx">Mailing Information</a>
                </li>
                <li>
                    <a href="DocumentList.aspx">Document List</a>
                </li>
                <li class="active">Order Item</li>
         </ul>
        
    
    <form runat="server">
            <h5 class="content-header">Order Item</h5>

         

            <table class="table table-striped" style="width:650px; margin-left:auto; margin-right:auto;" >
                <tbody>

                <asp:repeater ID="repDocumentname" runat="server">
                    <ItemTemplate>

                            <tr>
                                <td class="content-form_label">Document</td>
                                <td><%#Eval("Name")%> </td>
                            </tr>


                        </ItemTemplate>
                </asp:repeater>

                <asp:repeater ID="repAcademicProfile" runat="server">
                    <ItemTemplate>
                            <tr>
                                <td class="auto-style1">Academic Profile</td>
                                <td class="auto-style2"><%#Eval("Degree.Name")%></td>
                            </tr>

                    </ItemTemplate>
                </asp:repeater>
               
                <tr>
                    <td class="content-form_label">Price</td>
                    <td>
                        <table class="table table-striped">
                             <tr>
                                            
                                        <td style="width:220px;"><asp:RadioButton ID="rbRegular" GroupName="optProc" runat="Server" Checked="True" Selected="True"></asp:RadioButton>Regular Processing</td>
                                        <td>Php <asp:Label ID="lblRegularPrice" runat="server" Text="Label"></asp:Label></td>
                            </tr>
                            <tr>
                                        <td style="width:220px;"><asp:RadioButton ID="rbExpress" GroupName="optProc" runat="Server"></asp:RadioButton>Express Processing</td>
                                        <td> <asp:Label ID="lblExpressPrice" runat="server" Text="Not Available"></asp:Label></td>
                            </tr>
                            <tr>
                                <td><asp:CheckBox ID="cbPickup" runat="server"></asp:CheckBox>For Pick Up</td>
                                <td> <p id="pCampus" style="display:none; margin:0 0 0.2em;">Campus:</p>
                                    <asp:DropDownList id="ddlCampus" runat="server" ClientIDMode="Static" style="display:none; width:150px; top:0px;">
                                       
                                         <asp:ListItem Text="DLSU-Manila" value="0"/>
                                        <asp:ListItem Text="DLSU-STC" value="1"/>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            

                            <tr>
                                <td colspan="2">
                                    <span style="font-weight: bold; font-style: italic;">"Express processing is NOT available for students with ID no. <br/>80XXXXX (students who entered DLSU-Manila in 1980) and below."</span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="content-form_label">No. of Copies</td>
                    <td><asp:DropDownList id="ddlNoCopy" runat="server" style="display:block; width:30px;">
                                        <asp:ListItem Text="1" value="1"/>
                                        <asp:ListItem Text="2" value="2"/>
                                        <asp:ListItem Text="3" value="3"/>
                                    </asp:DropDownList>
                    </td>
                </tr>
                <tr class="delivery_only">
                    <td class="content-form_label" id="delivery_only2">Send to</td>
                    <td id="delivery_only1">
                        <asp:DropDownList ID="ddlAddresses" runat="server" style="display:block; width:150px;">
                            <asp:ListItem Text="Quezon City" value="Quezon City" />
                            <asp:ListItem Text="Manila" value="Manila" />
                            <asp:ListItem Text="Makati" value="Makati" />
                        </asp:DropDownList>
                    </td>


                

                    <td class="content-form_label">Insert Document In</td>
                    <td >
                        <asp:RadioButtonList ID="optInsert" RepeatDirection="Vertical" RepeatLayout="Flow" runat="server">
                          <asp:ListItem Text="Brown Envelope" Value="1" onclick="alert('For a DLSU security sticker to be used for sealing the envelope, please message the following email address: hub@dlsu.edu.ph.');" ></asp:ListItem>
                          <asp:ListItem Text="White Envelope" Value="2" onclick="alert('For a DLSU security sticker to be used for sealing the envelope, please message the following email address: hub@dlsu.edu.ph.');"></asp:ListItem>
                          <asp:ListItem Text="None" Value="0"></asp:ListItem>
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
                <asp:Button class="btn btn-primary" runat="server"  Text="Add to Cart" OnClick ="SubmitOrderInfo"/>
                  
            </div>
           </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">

    <script src="/Script/order_item.js"></script>

    <script runat ="server">
    </script>
</asp:Content>