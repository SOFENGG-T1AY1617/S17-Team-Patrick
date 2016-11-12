using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Database;
using SOFENGG_Order_Request_Document.View.Admin.Interface;

namespace SOFENGG_Order_Request_Document.Presenter.Admin
{
    public class DocumentListPresenter
    {
        private readonly IAdminModel _model;
        private readonly IDocumentListView _view;

        public DocumentListPresenter(IDocumentListView view)
        {
            _view = view;
            _model = new AdminModel();
        }

        public bool AddDocument(Document document)
        {
            return _model.AddDocument(document);
        }

        public bool EditDocument(Document document)
        {
            return _model.EditDocument(document);
        }

        public bool DeleteDocument(Document document)
        {
            return _model.DeleteDocument(document);
        }

        public void GetDocumentList()
        {
            _view.AvailableDocumentList = _model.GetDocumentList();
        }
    }
}