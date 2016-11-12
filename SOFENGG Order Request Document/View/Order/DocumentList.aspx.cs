using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Helper;
using SOFENGG_Order_Request_Document.Presenter.Order;
using SOFENGG_Order_Request_Document.View.Order.Interface;

namespace SOFENGG_Order_Request_Document.View.Order
{
    public partial class DocumentList : System.Web.UI.Page, IOrderDocumentListView
    {
        private readonly OrderDocumentListPresenter _presenter;
 

        public DocumentList()
        {
            _presenter = new OrderDocumentListPresenter(this);
        }

        public Document[] AvailableDocumentList
        {
            set
            {
                gvDocumentList.DataSource = value;
                gvDocumentList.DataBind();
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            GetDocumentList();
        }

        public void GetDocumentList()
        {
            _presenter.GetDocumentList();
            
        }

       
    }
}