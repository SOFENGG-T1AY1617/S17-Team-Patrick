using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
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
            var db = new DBMySqlAddStudentDegree(studentDegree);
            return db.ExecuteQuery();
        }

        public bool AddMailingInfo(MailingInfo mailingInfo)
        {
            var db = new DBMySqlAddMailingInfo(mailingInfo);
            return db.ExecuteQuery();
        }

        public Degree GetDegree(int StudentInfoId, String name, int CampusAttended, char Level)
        {
            var db = new DBMySqlGetDegreeList();
            db.Degree = new Degree()
            {
                CampusOffered = (CampusEnum)CampusAttended,
                Name = name,
                Level = (DegreeLevelEnum)Level,
            };
            db.SetCustomQuery(string.Format("SELECT * FROM {0} WHERE {1} = '" + db.Degree.Name + "' and " +
                                           "{2} = " + (int)db.Degree.CampusOffered + " and " +
                                           "{3} = '" + (char)db.Degree.Level + "';",
                                           Degree.Table,
                                           Degree.ColDegreeName, Degree.ColCampusOfferedId, Degree.ColLevel));
            db.ExecuteQuery();
            return db.DegreeList[0];
        }

        public Degree GetDegree(int DegreeId)
        {
            var db = new DBMySqlGetDegreeList();
            db.Degree = new Degree()
            {
                Id =  DegreeId,
            };
            db.SetCustomQuery(string.Format("SELECT * FROM {0} WHERE {1} = '" + db.Degree.Id + "';",
                                           Degree.Table, Degree.ColDegreeId));
            db.ExecuteQuery();
            return db.DegreeList[0];
        }

        public StudentInfo GetMyStudentInfo()
        {
            var db = new DBMySqlGetStudentInfo();
            db.ExecuteQuery();

            db.studentInfoList[db.studentInfoList.Length - 1].StudentDegreeList = null;
            db.studentInfoList[db.studentInfoList.Length - 1].MailingInfoList = null;

            return db.studentInfoList[db.studentInfoList.Length-1];
        }

        public StudentDegree[] GetStudentDegree(int studentInfoId)
        {
            var db = new DBMySqlGetStudentDegreeList();
            db.StudentInfoId = studentInfoId;
            db.ExecuteQuery();
            return db.StudentDegreeList;
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