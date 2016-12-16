using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Helper;

namespace SOFENGG_Order_Request_Document.View.Admin
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var userCookie = Request.Cookies[Personel.Table];

                if (userCookie == null)
                    return;

                Response.Cookies.Remove(Personel.Table);
                userCookie.Remove();
            }
            finally
            {
                Response.Redirect("~/View/Admin/Login.aspx");
            }
        }
    }
}