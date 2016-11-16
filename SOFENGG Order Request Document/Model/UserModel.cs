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

        public bool EditStudentInfo(StudentInfo studentInfo)
        {
            var db = new DBMySqlEditPersonalInformation(studentInfo);
            return db.ExecuteQuery();
        }


        public Degree GetDegree(int StudentInfoId, String name, int CampusAttended, char Level)
        {
            var db = new DBMySqlGetDegreeList();
            db.SetQueryGivenInput((CampusEnum)CampusAttended, name, (DegreeLevelEnum)Level);
            db.ExecuteQuery();
            return db.DegreeList[0];
        }

        public Degree GetDegree(int degreeId)
        {
            var db = new DBMySqlGetDegreeList();
            db.SetQueryGivenDegreeId(degreeId);
            db.ExecuteQuery();
            return db.DegreeList[0];
        }

        public Degree[] GetDegree()
        {
            var db = new DBMySqlGetDegreeList();
            db.SetQueryForAllDegree();
            db.ExecuteQuery();
            return db.DegreeList;
        }

        public StudentInfo GetMyStudentInfo(int studentInfoId)
        {
            var db = new DBMySqlGetStudentInfo();
            db.SetQueryForOneStudent(studentInfoId);
            db.ExecuteQuery();

            return db.studentInfoList[db.studentInfoList.Length-1];
        }

        public StudentInfo GetMyStudentInfo()
        {
            var db = new DBMySqlGetStudentInfo();
            db.SetQueryForAllStudentInfo();
            db.ExecuteQuery();
            return db.studentInfoList[db.studentInfoList.Length-1];
        }

        public StudentDegree[] GetStudentDegree(int studentInfoId)
        {
            var db = new DBMySqlGetStudentDegreeList();
            db.SetQueryGivenStudentInfoId(studentInfoId);
            db.ExecuteQuery();
            return db.StudentDegreeList;
        }

        public StudentDegree GetOneStudentDegree(int studentDegreeId)
        {
            var db = new DBMySqlGetStudentDegreeList();
            db.SetQueryGivenStudentDegreeId(studentDegreeId);
            db.ExecuteQuery();
            return db.StudentDegreeList[0];
        }

        public MailingInfo[] GetMailingInfo(int studentInfoId)
        {
            var db = new DBMySqlGetMailingInfo();
            db.SetQueryForAllMailInfo(studentInfoId);
            db.ExecuteQuery();
            return db.mailingInfoList;
        }

        public MailingInfo GetOneMailingInfo(int mailingInfo)
        {
            var db = new DBMySqlGetMailingInfo();
            db.SetQueryForOneMailInfo(mailingInfo);
            db.ExecuteQuery();
            return db.mailingInfoList[0];
        }

        public DeliveryArea[] GetAllDeliveryArea()
        {
            var db = new DBMySqlGetDeliveryArea();
            db.ExecuteQuery();
            return db.deliveryAreaList;
        }

        public DeliveryArea GetDeliveryArea(int deliveryId)
        {
            var deliveryAreaDB = new DBMySqlGetDeliveryArea();
            deliveryAreaDB.ExecuteQuery();

            for (int i = 0; i < deliveryAreaDB.deliveryAreaList.Length; i++)
            {
                if (deliveryAreaDB.deliveryAreaList[i].Id == deliveryId)
                {
                    return deliveryAreaDB.deliveryAreaList[i];
                }
            }
            return null;
        }

    }
}