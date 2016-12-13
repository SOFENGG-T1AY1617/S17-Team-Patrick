using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Web;
using System.Web.UI.WebControls;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Database;
using SOFENGG_Order_Request_Document.Presenter;
using SOFENGG_Order_Request_Document.View.Order.Interface;

namespace SOFENGG_Order_Request_Document.View.Order
{
    public partial class InfoMailConfirm : System.Web.UI.Page, IInfoMailDeView
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["StudentInfo"]["Id"] == null)
            {
                Response.Redirect("~/View/Order/Error.aspx");
            }
            StudentInfoId = int.Parse(Request.Cookies["StudentInfo"]["Id"]);
            DisplayAllMailingInfo();
        }

        private void DisplayAllMailingInfo()
        {
            int mailingInfoNumber = int.Parse(Request.Cookies["StudentInfo"]["MailingInfoNum"]);
            InfoMailDePresenter presenter = new InfoMailDePresenter(this);
            MailingInfo[] mailingInfo = presenter.GetMailingInfoList();
            List<MailingInfo> mailingInfoList = new List<MailingInfo>();
            for (var i = 0; i < mailingInfoNumber; i++)
            {
                HttpCookie cookie;
                if(Request.Cookies["MailInformation" + i] == null)
                    continue;
                cookie = Request.Cookies["MailInformation" + i];
                mailingInfoList.Add(new MailingInfo()
                {
                    ContactNo = cookie["ContactNo"],
                    DeliveryArea = presenter.GetOneDeliveryArea(int.Parse(cookie["DeliveryArea"])),
                    Id = i,
                    MailingAddress = cookie["MailingAddress"],
                    StudentInfoId = int.Parse(Request.Cookies["StudentInfo"]["Id"]),
                    ZipCode = int.Parse(cookie["Zipcode"]),
                });
            }
            rptInfoMailConfirm.DataSource = mailingInfoList;
            rptInfoMailConfirm.DataBind();
            if (mailingInfoList.Count == 0)
            {
                Response.Redirect("~/View/Order/InfoMailDe.aspx");
            }
        }

        protected void EditMailingInfo(object sender, EventArgs e)
        {
            Button button = sender as Button;
            var idControl = button.Parent.FindControl("updateBtns") as HiddenField;
            HttpCookie editCookie = new HttpCookie("EditCookie");
            editCookie["Id"] = idControl.Value;
            Response.Cookies.Add(editCookie);
            Response.Redirect("~/View/Order/InfoMailDe.aspx");
        }

        protected void AddMailingInfo(object sender, EventArgs e)
        {

            Response.Redirect("~/View/Order/InfoMailDe.aspx");

        }

        protected void DeleteMailingInfo(object sender, EventArgs e)
        {
            Button button = sender as Button;
            var idControl = button.Parent.FindControl("updateBtns") as HiddenField;

            HttpCookie deletedCookie = Request.Cookies["MailInformation" + idControl.Value];
            deletedCookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Add(deletedCookie);

            DisplayAllMailingInfo();

        }

        protected void GoToDocumentList(object sender, EventArgs e)
        {
            // .DEBUG.MODE. ============ TRYING ADDING OF COOKIES TO DATABASE ============== .DEBUG.MODE. //
            /*var studentInfoCookie = Request.Cookies["StudentInfo"];
            int acadInfoNumber = int.Parse(studentInfoCookie["StudentDegreeNum"]);
            int mailingInfoNumber = int.Parse(studentInfoCookie["MailingInfoNum"]);
            HttpCookie[] acadInfoCookie = new HttpCookie[acadInfoNumber];
            HttpCookie[] mailInfoCookie = new HttpCookie[mailingInfoNumber];
            for (int i = 0; i < acadInfoNumber; i++)
            {
                acadInfoCookie[i] = Request.Cookies["AcadInformation" + i];
            }
            for (int i = 0; i < mailingInfoNumber; i++)
            {
                mailInfoCookie[i] = Request.Cookies["MailInformation" + i];
            }
            var model = new UserModel();
            model.AddClientInformation(studentInfoCookie, acadInfoCookie, mailInfoCookie);*/

            Response.Redirect("~/View/Order/DocumentList.aspx");
        }

        public int StudentInfoId { get; set; }
        public string MailingAddress { get; set; }
        public int Zipcode { get; set; }
        public int DeliveryAreaId { get; set; }
        public string MailingContactNo { get; set; }
    }
}