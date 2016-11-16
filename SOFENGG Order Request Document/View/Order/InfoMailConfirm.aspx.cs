using System;
using System.Collections.Generic;
using SOFENGG_Order_Request_Document.Model;
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
            InfoMailDePresenter presenter = new InfoMailDePresenter(this);
            MailingInfo[] mailingInfo = presenter.GetMailingInfoList();
            List<MailingInfo> mailingInfoList = new List<MailingInfo>();
            for (var i = 0; i < mailingInfo.Length; i++)
            {
                mailingInfoList.Add(mailingInfo[i]);
            }
            rptInfoMailConfirm.DataSource = mailingInfoList;
            rptInfoMailConfirm.DataBind();
        }

        protected void EditMailingInfo(object sender, EventArgs e)
        {
            
        }

        protected void AddMailingInfo(object sender, EventArgs e)
        {
            Response.Redirect("~/View/Order/InfoMailDe.aspx");

        }

        protected void DeleteMailingInfo(object sender, EventArgs e)
        {
            
        }

        protected void GoToDocumentList(object sender, EventArgs e)
        {
            Response.Redirect("~/View/Order/DocumentList.aspx");
        }

        public int StudentInfoId { get; set; }
        public string MailingAddress { get; set; }
        public int Zipcode { get; set; }
        public int DeliveryAreaId { get; set; }
        public string MailingContactNo { get; set; }
    }
}