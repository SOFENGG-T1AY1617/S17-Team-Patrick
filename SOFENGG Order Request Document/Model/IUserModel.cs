using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SOFENGG_Order_Request_Document.Model
{
    interface IUserModel
    {
        StudentInfo GetStudentInfo();
        StudentDegree[] GetStudentDegree(int studentId);
        MailingInfo[] GetMailingInfo(int studentId);

    }
}
