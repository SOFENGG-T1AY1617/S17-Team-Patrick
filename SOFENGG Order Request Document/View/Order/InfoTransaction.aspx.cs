using System;
using System.Collections;
using System.Web;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Presenter.Order;

namespace SOFENGG_Order_Request_Document.View.Order
{
    public partial class InfoTransaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Cookies["StudentInfo"] == null) { 
            HttpCookie cookie = new HttpCookie("StudentInfo");
            cookie["Id"] = "2";
            Response.Cookies.Add(cookie);
            }

            InfoTransactionPresenter presenter = new InfoTransactionPresenter();
            ArrayList studentInfoList = new ArrayList();
            studentInfoList.Add(presenter.GetStudentInfo(int.Parse(Request.Cookies["StudentInfo"]["Id"])));
            rptPersonalInformation.DataSource = studentInfoList;
            rptPersonalInformation.DataBind();

          /*  ArrayList mailingInfoList = new ArrayList();
            mailingInfoList.AddRange(((StudentInfo)studentInfoList[0]).MailingInfoList);
            repDeliveryDetails.DataSource = mailingInfoList;
            repDeliveryDetails.DataBind(); */
        }
    }
}