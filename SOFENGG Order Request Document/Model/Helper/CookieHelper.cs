using System;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model.Helper
{
    public static class CookieHelper
    {
        public static void Remove(this HttpCookie c)
        {
             c.Expires = DateTime.Now.AddDays(-10);
             c.Value = null;
             HttpContext.Current.Response.SetCookie(c);
        }
    }
}