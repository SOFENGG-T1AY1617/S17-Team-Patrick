using System;
using SOFENGG_Order_Request_Document.Model;

namespace SOFENGG_Order_Request_Document.View.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var userCookie = Request[Personel.Table];

            if (userCookie == null)
                Response.Redirect("~/View/Admin/Login.aspx");
        }
    }
}