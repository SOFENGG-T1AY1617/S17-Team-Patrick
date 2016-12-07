using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Database;
using SOFENGG_Order_Request_Document.View.Order;
using SOFENGG_Order_Request_Document.View.Order.Interface;

namespace SOFENGG_Order_Request_Document.Presenter.Order
{
    public class OrderDocumentListPresenter
    {
        private readonly IOrderModel _model;
        private readonly IUserModel _umodel;
        private readonly IOrderDocumentListView _view;
       // private FormatParser formatParser;

        public OrderDocumentListPresenter(IOrderDocumentListView view)
        {
            _view = view;
            _model = new OrderModel();
            _umodel = new UserModel();
        }

       /* public OrderDocumentListPresenter(FormatParser formatParser)
        {
            this.formatParser = formatParser;
        } */

        /*public void GetDocumentList()
        {
            _view.AvailableDocumentList = _model.GetDocumentList();
        }*/

        public void GetCertificateDocumentList(DocumentCategoryEnum Category,int id)
        {
            
            _view.CertificateDocumentList = _model.GetCertificateDocumentList(Category, _umodel.GetDegree(id));

        }

        public void GetTORDocumentList(DocumentCategoryEnum Category,int id)
        {
            _view.TORDocumentList = _model.GetTORDocumentList(Category, _umodel.GetDegree(id));

        }

        public void GetTrueCopyDocumentList(DocumentCategoryEnum Category,int id)
        {
            _view.TrueCopyDocumentList = _model.GetTrueCopyDocumentList(Category, _umodel.GetDegree(id));

        }

        public void GetOthersDocumentList(DocumentCategoryEnum Category, int id)
        {
            _view.OthersDocumentList = _model.GetOthersDocumentList(Category, _umodel.GetDegree(id));

        }
    }
}