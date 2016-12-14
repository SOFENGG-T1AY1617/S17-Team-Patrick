<%@ Page Title="" Language="C#" MasterPageFile="~/View/Order/Order.Master" AutoEventWireup="true" CodeBehind="PersonalInformation.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.PersonalInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Always change the css file name to html file name! -->
    <link rel="stylesheet" href="/Content/css/personal_information.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
<div class = "container-fluid center-block" style="width:800px;">
        <ul class="breadcrumb">
            &nbsp;
            <li><a href="#" class="step"><i class="glyphicon glyphicon-home"></i></a></li>
            <li class="active">Personal Information</li>
        </ul>
        <h4 class="content-header">Personal Information</h4>
        <table class="table table-bordered table-striped">
            <tr>
                <td colspan="2" class="content-form_label">Please fill out the form below.</td>
            </tr>
            <tr>
                <td class="content-form_label">Last Name</td>
                <td>
                        <asp:TextBox ID="txtLName" class="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator id="rfvLName" runat="server"
                            ControlToValidate="txtLName"
                                ErrorMessage="Last name is a required field."
                                ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">First Name</td>
                <td>
                    <asp:TextBox ID="txtFName" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator id="rfvFName" runat="server"
                        ControlToValidate="txtFName"
                        ErrorMessage="First name is a required field."
                            ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">Middle Name</td>
                <td>
                    <asp:TextBox ID="txtMName" class="form-control" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">Gender</td>
                <td>
		                    <asp:RadioButtonList ID="optGender" runat="server" 
		                            RepeatDirection="Horizontal" RepeatLayout="Flow">
		                            <asp:ListItem class="radio-inline" Text="Male" Value="M"></asp:ListItem>
		                            <asp:ListItem class="radio-inline" Text="Female" Value="F"></asp:ListItem>
		                    </asp:RadioButtonList>
		                    <asp:RequiredFieldValidator id="rfvGender" runat="server"
		                        ControlToValidate="optGender"
		                        ErrorMessage="Gender is a required field."
		                            ForeColor="Red" Display="Dynamic">
		                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <!-- Add date using PHP/ASP here -->
            <tr>
                <td class="content-form_label">Birth Date</td>
                <td>
					<div class="btn-group">
	                    <asp:DropDownList ID="ddlBirthMonth" runat="server" Width="100px" onchange = "PopulateDays()" />
	                    <asp:DropDownList ID="ddlBirthDay" runat="server" Width="50px" />
						<asp:DropDownList ID="ddlBirthYear" runat="server" Width="80px" onchange = "PopulateDays()" />
                    <asp:RequiredFieldValidator id="rfvBirthYear" runat="server"
                        ControlToValidate="ddlBirthYear"
                        ErrorMessage="Birthyear is a required field."
                            ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator id="rfvBirthMonth" runat="server"
                        ControlToValidate="ddlBirthMonth"
                        ErrorMessage="Birthmonth is a required field."
                            ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator id="rfvBirthDay" runat="server"
                        ControlToValidate="ddlBirthDay"
                        ErrorMessage="Birthday is a required field."
                            ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator></div>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">Citizenship</td>
                <td>
                    <asp:TextBox ID="txtCitizen" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator id="rfvCitizen" runat="server"
                        ControlToValidate="txtCitizen"
                        ErrorMessage="Citizenship is a required field."
                            ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">Current Address</td>
                <td>
                    <asp:TextBox ID="txtCurrentAddress" class="form-control" runat="server" 
                        TextMode="MultiLine"  Columns="40" Rows="5"></asp:TextBox>
                    <asp:RequiredFieldValidator id="rfvCurrentAddress" runat="server"
                        ControlToValidate="txtCurrentAddress"
                        ErrorMessage="Entering your current address is required."
                            ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">Contact Number</td>
                <td>
                    <asp:TextBox ID="txtPhoneNum" class="form-control" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" id="rexPhoneNum" 
						controltovalidate="txtPhoneNum" validationexpression="^[0-9]{7,15}$" errormessage="Please enter your contact number containing 7 to 15 digits!"  Display="Dynamic"/>
                    <asp:RequiredFieldValidator id="rfvPhoneNum" runat="server"
                        ControlToValidate="txtPhoneNum" ErrorMessage="Phone number is a required field."
                            ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">Email Address</td>
                <td>
                    <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator
              			runat="server" ErrorMessage="Please enter a valid email address."
                 		 id="rexEmail" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" 
                  			ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                  	</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator id="rfvEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="E-mail address is a required field."
                            ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">High School Attended</td>
                <td>
                    <asp:TextBox ID="txtHSAttended" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator id="rfvHSAttended" runat="server"
                        ControlToValidate="txtHSAttended"
                        ErrorMessage="High school attended is a required field."
                            ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="content-form_label">Place of Birth</td>
                <td>
                    <asp:TextBox ID="txtBirthplace" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator id="rfvBirthplace" runat="server"
                        ControlToValidate="txtBirthplace"
                        ErrorMessage="birthplace is a required field."
                            ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <ul class="pager">
            <li class="previous disabled"><a href="#">&larr; Previous</a></li>
            <li class="next"><asp:LinkButton text="Next &rarr;" runat="server" OnClick="SubmitPersonalInformation_Click"></asp:LinkButton></li>
        </ul>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="/Script/personal_information.js"></script>
    <script src="/Script/Day.js"></script>
</asp:Content>