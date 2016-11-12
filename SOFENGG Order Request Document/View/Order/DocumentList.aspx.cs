using SOFENGG_Order_Request_Document.Model;
using System;

namespace SOFENGG_Order_Request_Document.View.Order
{
    public partial class DocumentList : System.Web.UI.Page, IDocumentListView
    {

        public Document[] AvailableDocumentList
         {
             set
             {
                 lvDocumentList.DataSource = value;
                 lvDocumentList.DataBind();
             }
         }










        /*   
         #region Initialization Functions

         public DocumentList()
         {
             _presenter = new DocumentListPresenter(this);
         }

         protected void listDoc_OnItemCreated(object sender, RepeaterItemEventArgs e)
         {
             var sm = ScriptManager.GetCurrent(this);
             if (sm == null)
                 return;

             sm.RegisterAsyncPostBackControl(btnAdd);
         }

         protected void Page_Load(object sender, EventArgs e)
         {
             if (IsPostBack)
                 return;

             GetDocumentList();
         }

         #endregion

       public void GetDocumentList()
         {
             _presenter.GetDocumentList();
             FormatPrices();
         }
         */

        public string Category
        {
            get
            {
                throw new NotImplementedException();
            }

            set
            {
                throw new NotImplementedException();
            }
        }

        public string Document
        {
            get
            {
                throw new NotImplementedException();
            }

            set
            {
                throw new NotImplementedException();
            }
        }

        public string ExpressPrice
        {
            get
            {
                throw new NotImplementedException();
            }

            set
            {
                throw new NotImplementedException();
            }
        }

        public string RegularPrice
        {
            get
            {
                throw new NotImplementedException();
            }

            set
            {
                throw new NotImplementedException();
            }
        }

        
    }
}