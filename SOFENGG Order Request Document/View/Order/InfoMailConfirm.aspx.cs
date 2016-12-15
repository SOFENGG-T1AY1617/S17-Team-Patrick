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

            if (!IsPostBack)
            {
                DisplayAllMailingInfo();
            }
        }

        private void DisplayAllMailingInfo()
        {
            int mailingInfoNumber = int.Parse(Request.Cookies["StudentInfo"]["MailingInfoNum"]);
            InfoMailDePresenter presenter = new InfoMailDePresenter(this);
            var contactNoCookie = Request.Cookies["MailInformation"]["ContactNo"].Split('|');
            var deliveryAreaCookie = Request.Cookies["MailInformation"]["DeliveryArea"].Split('|');
            var idCookie = Request.Cookies["MailInformation"]["Id"].Split('|');
            var mailingAddressCookie = Request.Cookies["MailInformation"]["MailingAddress"].Split('|');
            var zipCodeCookie = Request.Cookies["MailInformation"]["Zipcode"].Split('|');
            List<MailingInfo> mailingInfoList = new List<MailingInfo>();
            for (var i = 0; i < mailingInfoNumber; i++)
            {
                var cookie = Request.Cookies["MailInformation"];
                mailingInfoList.Add(new MailingInfo()
                {
                    ContactNo = contactNoCookie[i],
                    DeliveryArea = presenter.GetOneDeliveryArea(int.Parse(deliveryAreaCookie[i])),
                    Id = i,
                    MailingAddress = mailingAddressCookie[i],
                    StudentInfoId = int.Parse(Request.Cookies["StudentInfo"]["Id"]),
                    ZipCode = int.Parse(zipCodeCookie[i]),
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
            var index = int.Parse(idControl.Value);

            InfoMailDePresenter presenter = new InfoMailDePresenter(this);
            HttpCookie cookie = presenter.DeleteMailInfoCookie(Request.Cookies["AcadInformation"], index);
            Response.Cookies.Add(cookie);

            HttpCookie studentInfoCookie = Request.Cookies["StudentInfo"];
            studentInfoCookie["StudentDegreeNum"] = (int.Parse(Request.Cookies["StudentInfo"]["MailingInfoNum"]) - 1) + "";
            Response.Cookies.Add(studentInfoCookie);

            Response.Redirect("~/View/Order/InfoMailConfirm.aspx");
            

        }

        protected void GoToDocumentList(object sender, EventArgs e)
        {
            // .DEBUG.MODE. ============ TRYING ADDING OF COOKIES TO DATABASE ============== .DEBUG.MODE. //
            /*var studentInfoCookie = Request.Cookies["StudentInfo"];
            HttpCookie acadInfoCookie = Request.Cookies["AcadInformation"];
            HttpCookie mailInfoCookie = Request.Cookies["MailInformation"];
            var model = new UserModel();
            if(model.AddClientInformation(studentInfoCookie, acadInfoCookie, mailInfoCookie))
                Debug.Write("ClientInformation has been added to the database");
            */

            Response.Redirect("~/View/Order/DocumentList.aspx");
        }

        public int StudentInfoId { get; set; }
        public string MailingAddress { get; set; }
        public int Zipcode { get; set; }
        public int DeliveryAreaId { get; set; }
        public string MailingContactNo { get; set; }
    }
}