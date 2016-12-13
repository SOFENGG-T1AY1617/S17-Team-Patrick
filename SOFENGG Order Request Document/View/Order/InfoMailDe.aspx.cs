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
            try { 
                StudentInfoId = int.Parse(Request.Cookies["StudentInfo"]["Id"]);
            }catch(Exception)
            {
                Response.Redirect("~/View/Order/Error.aspx");
            }

            try{
                if (!IsPostBack){
                    if (Request.Cookies["EditCookie"]["Id"] != null){
                        PopulatePreviousInput(int.Parse(Request.Cookies["EditCookie"]["Id"]));
                    }
                }
            }
            catch (NullReferenceException) { }


        }

        protected void SubmitMailInfo(object sender, EventArgs e)
        {
            StudentInfoId = int.Parse(Request.Cookies["StudentInfo"]["Id"]);
            MailingAddress = txtMailAddress.Text;
            MailingContactNo = txtMailingNum.Text;
            Zipcode = int.Parse(txtZipCode.Text);
            DeliveryAreaId = int.Parse(ddlDelivery.SelectedItem.Value);

            int editInfoId = 0;
            try
            {
                editInfoId = int.Parse(Request.Cookies["EditCookie"]["Id"]);
                HttpCookie editCookie = new HttpCookie("EditCookie");
                editCookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(editCookie);
            }
            catch (NullReferenceException)
            {
                editInfoId = int.Parse(Request.Cookies["StudentInfo"]["MailingInfoNum"]);
                HttpCookie studentCookie = Request.Cookies["StudentInfo"];
                int studentDegreeNum = int.Parse(studentCookie["MailingInfoNum"]) + 1;
                studentCookie["MailingInfoNum"] = studentDegreeNum.ToString();
                Response.Cookies.Add(studentCookie);
            }

            InfoMailDePresenter presenter = new InfoMailDePresenter(this);
            HttpCookie mailInfoCookie = presenter.AddMailInfoCookie(int.Parse(Request.Cookies["StudentInfo"]["Id"]),
                                                                    editInfoId);

            Response.Cookies.Add(mailInfoCookie);
            Response.Redirect("~/View/Order/InfoMailConfirm.aspx");

        }

        private void PopulatePreviousInput(int i)
        {
            //can only be accessed when pressed EDIT
            HttpCookie cookie = Request.Cookies["MailInformation" + i];
            InfoMailDePresenter presenter = new InfoMailDePresenter(this);

            txtMailAddress.Text = cookie["MailingAddress"];
            txtMailingNum.Text = cookie["ContactNo"];
            txtZipCode.Text = cookie["Zipcode"];
            ddlDelivery.SelectedItem.Selected = false;
            ddlDelivery.Items.FindByValue(cookie["DeliveryArea"]).Selected = true;
        }

        public int StudentInfoId { get; set; }
        public string MailingAddress { get; set; }
        public int Zipcode { get; set; }
        public int DeliveryAreaId { get; set; }
        public string MailingContactNo { get; set; }
    }
}