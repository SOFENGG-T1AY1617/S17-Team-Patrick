using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Helper;
using SOFENGG_Order_Request_Document.Presenter.Order;
using SOFENGG_Order_Request_Document.View.Order.Interface;
using System.Web;
using System.Diagnostics;

namespace SOFENGG_Order_Request_Document.View.Order
{
    public partial class DocumentList : System.Web.UI.Page, IOrderDocumentListView
    {
        private int[] _degreeIdList;

        private readonly OrderDocumentListPresenter _presenter;

        public int id { get; set; }



        public DocumentList()
        {
            _presenter = new OrderDocumentListPresenter(this);
        }

        //        protected void OnSelectedIndexChangedTrueCopy(object sender, EventArgs e)
        //        {
        //            string documentname = gvTrueCopy.SelectedRow.Cells[0].Text;
        //            HttpCookie docuCookie = new HttpCookie("Document");
        //            // docuCookie[""];
        //            if (documentname.Equals("Transcript of Records"))
        //            {
        //                docuCookie["id"] = 5 + "";
        //            }
        //            else if (documentname.Equals("Form 137"))
        //            {
        //                docuCookie["id"] = 6 + "";
        //            }
        //
        //            Response.Cookies.Add(docuCookie);
        //            Response.Redirect("~/View/Order/OrderItem.aspx");
        //        }


        protected void Page_Load(object sender, EventArgs e)
        {
            var cookie = new HttpCookie("StudentInfo");
            cookie["StudentDegreeNum"] = 2 + "";
            Response.Cookies.Add(cookie);

            cookie = new HttpCookie("AcadInformation0");
            cookie["Degree"] = 1 + "";
            Response.Cookies.Add(cookie);

            cookie = new HttpCookie("AcadInformation0");
            cookie["Degree"] = 2 + "";
            Response.Cookies.Add(cookie);

            if (IsPostBack)
                return;

            var isValidRequest = false;

            try
            {
                // Get all degree id
                var studentInfoCookie = Request.Cookies["StudentInfo"];
                if (studentInfoCookie == null)
                    return;

                var degreeCountString = studentInfoCookie["StudentDegreeNum"];

                if (string.IsNullOrEmpty(degreeCountString) || int.Parse(degreeCountString) == 0)
                    return;

                var degreeCount = int.Parse(degreeCountString);
                var degreeIdList = new List<int>();

                for (var i = 0; i < degreeCount; i++)
                {
                    var acadInfoCookie = Request.Cookies["AcadInformation" + i];

                    if (acadInfoCookie == null)
                        continue;

                    var degreeIdString = acadInfoCookie["Degree"];
                    if (string.IsNullOrEmpty(degreeIdString) || int.Parse(degreeIdString) == 0)
                        continue;

                    degreeIdList.Add(int.Parse(degreeIdString));
                }

                if (degreeIdList.Count <= 0)
                    return;

                _degreeIdList = degreeIdList.ToArray();

                // Get all documents
                GetDocumentList();

                isValidRequest = true;
            }
            finally
            {
                if (!isValidRequest)
                    Response.Redirect("~/View/Order/InfoAcadDe.aspx");
            }

        }

        public void GetDocumentList()
        {
            repDocumentList.DataSource = _presenter.GetDocumentListSortByCategory(_degreeIdList);
            repDocumentList.DataBind();
        }

        protected void btnOrder_OnClick(object sender, EventArgs e)
        {
            var btn = (Button)sender;
            var gvr = (GridViewRow)btn.NamingContainer;

            var documentId = int.Parse(gvr.Cells[0].Text);

            var docuCookie = new HttpCookie("Order");
            docuCookie["DocumentId"] = documentId.ToString();
            Response.Cookies.Add(docuCookie);
            Response.Redirect("~/View/Order/OrderItem.aspx");
        }
    }




}