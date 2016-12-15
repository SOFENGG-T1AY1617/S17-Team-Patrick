using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using System.Web.Script.Serialization;
using System.Web.Services;
using SOFENGG_Order_Request_Document.Presenter.Admin;

namespace SOFENGG_Order_Request_Document.View.Admin
{
    [ServiceContract(Namespace = "AdminService")]
    [ServiceBehavior(IncludeExceptionDetailInFaults = true)]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class MainService2
    {
        // To use HTTP GET, add [WebGet] attribute. (Default ResponseFormat is WebMessageFormat.Json)
        // To create an operation that returns XML,
        //     add [WebGet(ResponseFormat=WebMessageFormat.Xml)],
        //     and include the following line in the operation body:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";

        
        private ViewOrderListPresenter2 _presenter;

        public MainService2()
        {
            _presenter = new ViewOrderListPresenter2();    
        }

        [OperationContract]
        public string GetOrderInformation(int referenceNo)
        {
            Debug.WriteLine("Service Started: " + DateTime.Now.Millisecond);
            var info = _presenter.GetOrderInformation(referenceNo);
            Debug.WriteLine("Service Ended: " + DateTime.Now.Millisecond);
            return new JavaScriptSerializer().Serialize(info);
        }

        // Add more operations here and mark them with [OperationContract]
    }
}
