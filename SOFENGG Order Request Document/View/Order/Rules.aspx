<%@ Page Title="" Language="C#" MasterPageFile="~/Order/Order.Master" AutoEventWireup="true" CodeBehind="Rules.aspx.cs" Inherits="SOFENGG_Order_Request_Document.View.Order.Rules" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Content/css/rules.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container-fluid center-block">
        <h4 class="content-header">Policies and Procedures</h5>
        <ol>
            <li>This Online Request for Documents consists of 6 steps, which can be completed in approximately 10 minutes.</li>
            <li>The processing period indicated herein (whether regular or express) is different and 
                    distinct from the delivery period which is dependent on the location you have specified.</li>
            <li>This Online Request for Documents includes an online payment facility using your international credit card. 
                Accepted credit cards are Visa, Mastercard, JCB and American Express. The Request is deemed submitted to the 
                Office of the University Registrar and valid for processing upon approval of the credit card payment.</li>
            <li style="color: rgb(203, 66, 66)">Because of the automated nature of this online request for documents and payment, no request for cancellation, substitution, refund and the like may be entertained.</li>
            <li>The processing of request for documents carries with it the responsibility of securing clearances from certain offices / units in the university. If, for any reason, your name is in any of these lists, we regret that we cannot process your request and we will inform you accordingly.</li>
            <li>Unauthorized request is punishable by law.</li>
            <li>For questions or follow-up please e-mail <a href="mailto:hub@dlsu.edu.ph?Subject=Online%20Request%20of%20Documents">hub@dlsu.edu.ph</a></li>
        </ol>

        <div class="col-xs-9">
            <asp:Label id="labelCB" AssociatedControlId="checkbox" 
                Text="I have read and understood the policies regarding this facility." runat="server" />
            <asp:CheckBox ID="checkbox" runat="server"></asp:CheckBox>
        </div>

        <div class="col-xs-3">
            <a id="continue" href="/personal_information.html" class="btn btn-primary disabled">Continue</a>
        </div>

        <br>

        <div class="card-images">
            <span><img src="Content/images/logo_visa1.gif" alt=""></span>
            <span><img src="Content/images/logo_master1.gif" alt=""></span>
            <span><img src="Content/images/logo_jcb1.gif" alt=""></span>
            <span><img src="Content/images/logo_amex1.gif" alt=""></span>
        </div>

    </div>
</asp:Content>
<asp:Content ID="script" ContentPlaceHolderID="script" runat="server">
    <script src="/Script/rules.js"></script>
</asp:Content>