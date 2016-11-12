using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SOFENGG_Order_Request_Document.Model
{
    interface IUserModel
    {
        bool AddStudentInfo(StudentInfo studentInfo);
        bool AddStudentDegree(StudentDegree studentDegree);
        bool AddMailingInfo(MailingInfo mailingInfo);
        StudentInfo GetMyStudentInfo();
        StudentDegree[] GetStudentDegree(int studentId);
        MailingInfo[] GetMailingInfo(int studentId);


    }
}
