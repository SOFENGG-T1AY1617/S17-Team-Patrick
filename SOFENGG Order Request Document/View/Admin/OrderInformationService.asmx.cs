using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace SOFENGG_Order_Request_Document.View.Admin
{
    /// <summary>
    /// Summary description for OrderInformationService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class OrderInformationService : System.Web.Services.WebService
    {

        //[WebMethod]
        //public bool IsEmailIdAvailable(string emailId)
        //{
        //    bool ret = false;
        //    try
        //    {
        //        using (EmployeeDbContext db = new EmployeeDbContext())
        //        {
        //            ret = !db.EmployeeDetails.Any(x => x.EmailId.Equals(emailId));
        //        }
        //        return ret;
        //    }
        //    catch
        //    {
        //        return false;
        //    }
        //}   
    }
}
