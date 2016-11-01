<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DocumentList.aspx.cs" Inherits="SOFENGG_Order_Request_Document.Admin.DocumentList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Content/css/admin_document_list.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
<div class="col-xs-2 content-sidebar">
    <h3>Menu</h3>
    <br>
    <ul>
        <li>
            <a href="admin_main.html">Home</a>
        </li>
        <li>
            <b>Maintain Document List</b>
        </li>
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
<h3>Document List</h3>

<div class="content-scrolling">
    <div>
        <table class="table table-hover">
            <thead>
            <tr>
                <td></td>
                <td></td>
                <td>Document</td>
                <td>Category</td>
                <td>Regular Charge</td>
                <td>Express Charge</td>
                <td>Weight</td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <input type="checkbox" name="optDoc">
                </td>
                <td class="warning">
                    <button class="btn btn-xs btn-warning edit_button">Edit</button>
                </td>
                <td>Completion of Academic Units</td>
                <td>Certification</td>
                <td>Php 110.00</td>
                <td>Unavailable</td>
                <td>10gs</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="optDoc">
                </td>
                <td class="warning">
                    <button class="btn btn-xs btn-warning edit_button">Edit</button>
                </td>
                <td>Course (Subject) Description</td>
                <td>Certification</td>
                <td>Php 110.00</td>
                <td>Unavailable</td>
                <td>10gs</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="optDoc">
                </td>
                <td class="warning">
                    <button class="btn btn-xs btn-warning edit_button">Edit</button>
                </td>
                <td>Cumulative GPA</td>
                <td>Certification</td>
                <td>Php 110.00</td>
                <td>Php 220.00</td>
                <td>10gs</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="optDoc">
                </td>
                <td class="warning">
                    <button class="btn btn-xs btn-warning edit_button">Edit</button>
                </td>
                <td>Dean's List</td>
                <td>Certification</td>
                <td>Php 110.00</td>
                <td>Php 220.00</td>
                <td>10gs</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="optDoc">
                </td>
                <td class="warning">
                    <button class="btn btn-xs btn-warning edit_button">Edit</button>
                </td>
                <td>Enrollment</td>
                <td>Certification</td>
                <td>Php 110.00</td>
                <td>Php 220.00</td>
                <td>10gs</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="optDoc">
                </td>
                <td class="warning">
                    <button class="btn btn-xs btn-warning edit_button">Edit</button>
                </td>
                <td>Form 137</td>
                <td>Certified True Copy</td>
                <td>Php 50.00</td>
                <td>Unavailable</td>
                <td>10gs</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="optDoc">
                </td>
                <td class="warning">
                    <button class="btn btn-xs btn-warning edit_button">Edit</button>
                </td>
                <td>Form 138</td>
                <td>Certified True Copy</td>
                <td>Php 50.00</td>
                <td>Unavailable</td>
                <td>10gs</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="optDoc">
                </td>
                <td class="warning">
                    <button class="btn btn-xs btn-warning edit_button">Edit</button>
                </td>
                <td>Grading System</td>
                <td>Certification</td>
                <td>Php 110.00</td>
                <td>Php 220.00</td>
                <td>10gs</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="optDoc">
                </td>
                <td class="warning">
                    <button class="btn btn-xs btn-warning edit_button">Edit</button>
                </td>
                <td>Graduation / With Honors</td>
                <td>Certification</td>
                <td>Php 110.00</td>
                <td>Php 220.00</td>
                <td>10gs</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="optDoc">
                </td>
                <td class="warning">
                    <button class="btn btn-xs btn-warning edit_button">Edit</button>
                </td>
                <td>Official Transcript of Records</td>
                <td>Certification</td>
                <td>Php 150.00</td>
                <td>Unavailable</td>
                <td>10gs</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="optDoc">
                </td>
                <td class="warning">
                    <button class="btn btn-xs btn-warning edit_button">Edit</button>
                </td>
                <td>Ranking By Degree Program</td>
                <td>Certification</td>
                <td>Php 150.00</td>
                <td>Unavailable</td>
                <td>10gs</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="optDoc">
                </td>
                <td class="warning">
                    <button class="btn btn-xs btn-warning edit_button">Edit</button>
                </td>
                <td>Ranking By College</td>
                <td>Certification</td>
                <td>Php 150.00</td>
                <td>Unavailable</td>
                <td>10gs</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="optDoc">
                </td>
                <td class="warning">
                    <button class="btn btn-xs btn-warning edit_button">Edit</button>
                </td>
                <td>Special Credentials</td>
                <td>Others</td>
                <td>Php 150.00</td>
                <td>Unavailable</td>
                <td>10gs</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="optDoc">
                </td>
                <td class="warning">
                    <button class="btn btn-xs btn-warning edit_button">Edit</button>
                </td>
                <td>Trimestral Calendar</td>
                <td>Certification</td>
                <td>Php 150.00</td>
                <td>Unavailable</td>
                <td>10gs</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="content-main_report">
    <button class="btn btn-danger" id="delete_button">Delete Selected</button>
    <button class="btn btn-primary" id="add_button">Add Document</button>
</div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="other" runat="server">

    <div class="popup edit">
        <p>Document Name</p>
        <input class="form-control" type="text" placeholder="Document Name">
        <p>Regular Charge</p>
        <input class="form-control" type="text" placeholder="100">
        <p>
            <input class="available_express" type="checkbox" checked="checked">&nbsp;Express Charge
        </p>
        <input class="form-control express_charge" type="text" placeholder="200">
        <p>Weight (gs.)</p>
        <input class="form-control" type="text" placeholder="10">
        <div>
            <button id="yes_edit" class="btn btn-success">Save</button>
            <button id="no_edit" class="btn btn-warning">Cancel</button>
        </div>
    </div>

    <div class="popup add">
        <p>Document Name</p>
        <input class="form-control" type="text" placeholder="Document Name">
        <p>Regular Charge</p>
        <input class="form-control" type="text" placeholder="Price">
        <p>
            <input class="available_express" type="checkbox" checked="checked">&nbsp;Express Charge
        </p>
        <input class="form-control express_charge" type="text" placeholder="Price">
        <p>Weight (gs.)</p>
        <input class="form-control" type="text" placeholder="Weight">
        <div>
            <button id="yes_add" class="btn btn-success">Add</button>
            <button id="no_add" class="btn btn-warning">Cancel</button>
        </div>
    </div>

    <div class="popup delete">
        <p>Delete # item(s)?</p>
        <div>
            <button id="yes_delete" class="btn btn-danger">Yes</button>
            <button id="no_delete" class="btn btn-primary">No</button>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
    <script src="/Script/admin_document_list.js"></script>
</asp:Content>