using System;
using System.Collections.Generic;
using System.Diagnostics;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Presenter;
using SOFENGG_Order_Request_Document.View.Order.Interface;

namespace SOFENGG_Order_Request_Document.View.Order
{
    public partial class InfoMailDe : System.Web.UI.Page, IInfoMailDeView
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["StudentInfo"]["Id"] == null)
            {
                Response.Redirect("~/View/Order/Error.aspx");
            }
            StudentInfoId = int.Parse(Request.Cookies["StudentInfo"]["Id"]);
        }

        protected void SubmitMailInfo(object sender, EventArgs e)
        {
            InfoMailDePresenter presenter = new InfoMailDePresenter(this);

            StudentInfoId = int.Parse(Request.Cookies["StudentInfo"]["Id"]);
            MailingAddress = txtMailAddress.Text;
            MailingContactNo = txtMailingNum.Text;
            Zipcode = int.Parse(txtZipCode.Text);
            DeliveryAreaId = int.Parse(ddlDelivery.SelectedItem.Value);

            
            if (presenter.AddMailInfo())
            {
                Response.Redirect("~/View/Order/InfoMailConfirm.aspx");
            }
        }


        protected void SubmitMailInfo(object sender, EventArgs e)
        {
            InfoMailDePresenter presenter = new InfoMailDePresenter(this);

            StudentInfoId = int.Parse(Request.Cookies["StudentInfoId"]["Id"]);
            MailingAddress = txtMailAddress.Text;
            MailingContactNo = txtMailingNum.Text;
            Zipcode = int.Parse(txtZipCode.Text);
            DeliveryAreaId = int.Parse(ddlDelivery.SelectedItem.Value);

            if (presenter.AddMailInfo())
            {
                Response.Redirect("~/View/Order/DocumentList.aspx");
            }
        }

        public int StudentInfoId { get; set; }
        public string MailingAddress { get; set; }
        public int Zipcode { get; set; }
        public int DeliveryAreaId { get; set; }
        public string MailingContactNo { get; set; }
    }
}