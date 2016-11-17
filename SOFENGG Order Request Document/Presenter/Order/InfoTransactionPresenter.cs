using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Database;

namespace SOFENGG_Order_Request_Document.Presenter.Order
{
    public class InfoTransactionPresenter
    {
        UserModel UserModel;
        OrderModel OrderModel;

        public InfoTransactionPresenter()
        {
            UserModel = new UserModel();
            OrderModel = new OrderModel();
        }

        public StudentInfo GetStudentInfo(int studentInfoId)
        {
            StudentInfo studentInfo = new StudentInfo();
            studentInfo = UserModel.GetMyStudentInfo(studentInfoId);
            studentInfo.MailingInfoList = UserModel.GetMailingInfo(studentInfoId);
            studentInfo.StudentDegreeList = UserModel.GetStudentDegree(studentInfoId);

            return studentInfo;

        }

    }
}