using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Presenter.Order
{
    public class OrderItemPresenter
    {
        UserModel usermodel;
        OrderModel ordermodel;

        public OrderItemPresenter()
        {
            usermodel = new UserModel();
            ordermodel = new OrderModel();
        }

        public Document getDocumentName(int documentId)
        {
            return ordermodel.GetDocument(documentId);
        }

       public StudentDegree[] getAcademicProfile(int studentId)
        {
         
            return usermodel.GetStudentDegree(studentId);
        }

    }
}