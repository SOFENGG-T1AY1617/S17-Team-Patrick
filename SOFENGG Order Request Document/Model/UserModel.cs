using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SOFENGG_Order_Request_Document.Model.Database.Interface;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class UserModel : IUserModel
    {
        public bool AddStudentInfo(StudentInfo studentInfo)
        {
            var db = new DBMySqlAddPersonalInformation(studentInfo);
            return db.ExecuteQuery();
        }

        public bool AddStudentDegree(StudentDegree studentDegree)
        {
            throw new NotImplementedException();
        }

        public bool AddMailingInfo(MailingInfo mailingInfo)
        {
            throw new NotImplementedException();
        }

        public StudentInfo GetMyStudentInfo()
        {
            var db = new DBMySqlGetStudentInfo();
            db.ExecuteQuery();

            db.studentInfoList[db.studentInfoList.Length - 1].StudentDegreeList = null;
            db.studentInfoList[db.studentInfoList.Length - 1].MailingInfoList = null;

            return db.studentInfoList[db.studentInfoList.Length-1];
        }




        public StudentDegree[] GetStudentDegree(int studentId)
        {
            var db = new DBMySqlGetStudentDegreeList();
            db.ExecuteQuery();
            return db.studentDegreeList;
        }

        public MailingInfo[] GetMailingInfo(int studentId)
        {
            var db = new DBMySqlGetMailingInfo();
            db.ExecuteQuery();
            return db.mailingInfoList;
        }


        public bool AddMailingInfo(MailingInfo mailingInfo, int studentId)
        {
            var db = new DBMySqlAddMailingInfo(mailingInfo);
            db.StudentId = studentId;
            return db.ExecuteQuery();
        }

        public bool AddStudentDegree(StudentDegree studentDegree, int studentId)
        {
            var db = new DBMySqlAddStudentDegree(studentDegree);
            db.StudentId = studentId;
            return db.ExecuteQuery();
        }
    }
}