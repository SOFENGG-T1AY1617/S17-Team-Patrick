﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SOFENGG_Order_Request_Document.Model.Database.Interface;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class UserModel : IUserModel
    {

        public StudentInfo GetStudentInfo()
        {
            throw new NotImplementedException();
            var db = new DBMySqlGetStudentInfo();
            db.ExecuteQuery();
            return db.studentInfo;
        }

        public StudentDegree[] GetStudentDegree(int studentId)
        {
            throw new NotImplementedException();
            var db = new DBMySqlGetStudentDegreeList();
            db.ExecuteQuery();
            return db.studentDegreeList;
        }

        public MailingInfo[] GetMailingInfo(int studentId)
        {
            throw new NotImplementedException();
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