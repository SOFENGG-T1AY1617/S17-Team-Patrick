using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Database;
using SOFENGG_Order_Request_Document.Model.Database.ManageOperationalDate;
using SOFENGG_Order_Request_Document.View.Admin.Interface;

namespace SOFENGG_Order_Request_Document.Presenter.Admin
{
    public class ManageOperationalDatePresenter
    {
        private readonly IAdminModel _model;
        private readonly IManageOperationalDateView _view;

        public ManageOperationalDatePresenter(IManageOperationalDateView view)
        {
            _view = view;
            _model = new AdminModel();
        }

        public Offline[] GetOfflineDateList()
        {
            return _model.GetOfflineDateList();
        }

        public bool AddOfflineDate(Offline offline)
        {
            return _model.AddOfflineDate(offline);
        }
        
        public bool DeleteOfflineDate(DateTime date)
        {
            return _model.DeleteOfflineDate(date);
        }
    }
}