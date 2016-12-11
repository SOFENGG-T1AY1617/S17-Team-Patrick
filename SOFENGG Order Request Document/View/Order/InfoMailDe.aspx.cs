using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Web;
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
            

            StudentInfoId = int.Parse(Request.Cookies["StudentInfo"]["Id"]);
            MailingAddress = txtMailAddress.Text;
            MailingContactNo = txtMailingNum.Text;
            Zipcode = int.Parse(txtZipCode.Text);
            DeliveryAreaId = int.Parse(ddlDelivery.SelectedItem.Value);

            InfoMailDePresenter presenter = new InfoMailDePresenter(this);
            HttpCookie mailInfoCookie = presenter.AddMailInfoCookie(int.Parse(Request.Cookies["StudentInfo"]["Id"]),
                                                                    int.Parse(Request.Cookies["StudentInfo"]["MailingInfoNum"]));

            Response.Cookies.Add(mailInfoCookie);
            HttpCookie studentCookie = Request.Cookies["StudentInfo"];
            int mailInfoNum = int.Parse(studentCookie["MailingInfoNum"]) + 1;
            studentCookie["MailingInfoNum"] = mailInfoNum.ToString();
            Response.Cookies.Add(studentCookie);
            Response.Redirect("~/View/Order/InfoMailConfirm.aspx");

        }

        public int StudentInfoId { get; set; }
        public string MailingAddress { get; set; }
        public int Zipcode { get; set; }
        public int DeliveryAreaId { get; set; }
        public string MailingContactNo { get; set; }
    }
}