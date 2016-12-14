using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using SOFENGG_Order_Request_Document.Presenter.Admin;
using SOFENGG_Order_Request_Document.View.Admin.Interface;

namespace SOFENGG_Order_Request_Document.View.Admin
{
    /// <summary>
    /// Summary description for Main1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class MainService : System.Web.Services.WebService
    {
        private ViewOrderListPresenter2 _presenter;

        public MainService()
        {
            _presenter = new ViewOrderListPresenter2();    
        }

        [WebMethod]
        public Model.Order GetOrderInformation(int id)
        {
            return _presenter.GetOrderInformation(id);
        }
    }
}
