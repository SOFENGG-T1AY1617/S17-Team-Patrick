using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class UserModel : IUserModel
    {
        bool IUserModel.GetMailingInfo(MailingInfo mailInfo)
        {
            throw new NotImplementedException();
        }

        bool IUserModel.GetStudentDegree(StudentDegree[] studentDegree)
        {
            throw new NotImplementedException();
        }

        bool IUserModel.GetStudentInfo(StudentInfo studentInfo)
        {
            throw new NotImplementedException();
        }
    }
}