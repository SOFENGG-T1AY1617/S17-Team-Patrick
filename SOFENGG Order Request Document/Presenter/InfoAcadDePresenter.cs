using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Database;
using SOFENGG_Order_Request_Document.View.Order.Interface;

namespace SOFENGG_Order_Request_Document.Presenter
{
    public class InfoAcadDePresenter
    {
        IInfoAcadDeView view;
        UserModel model;

        public InfoAcadDePresenter(IInfoAcadDeView view)
        {
            model = new UserModel();
            this.view = view;
        }

        public bool AddStudentDegree()
        {
            if (true)
            {
                return true;
            }
            return false;

        }

        public StudentDegree[] GetStudentDegree()
        {
            return new StudentDegree[100];    
        }

    }
}