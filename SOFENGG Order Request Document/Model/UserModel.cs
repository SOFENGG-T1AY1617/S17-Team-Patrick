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


        public bool AddClientInformation(HttpCookie studentInfoCookie, HttpCookie[] acadInfoCookie, HttpCookie[] mailInfoCookie)
        {
            var studentInfo = new StudentInfo()
            {
                StudentInfoId = int.Parse(studentInfoCookie["Id"]),
                FirstName = studentInfoCookie["FirstName"],
                LastName = studentInfoCookie["LastName"],
                MiddleName = studentInfoCookie["MiddleName"],
                BirthDate = Convert.ToDateTime(studentInfoCookie["BirthDate"]),
                Citizenship = studentInfoCookie["Citizenship"],
                CurrentAddress = studentInfoCookie["CurrentAddress"],
                Email = studentInfoCookie["Email"],
                Gender = (GenderEnum)((char)int.Parse(studentInfoCookie["Gender"])),
                HighSchoolAttended = studentInfoCookie["HighSchoolAttended"],
                PlaceOfBirth = studentInfoCookie["PlaceOfBirth"],
                PhoneNumber = studentInfoCookie["PhoneNumber"],
            };
            if(!AddStudentInfo(studentInfo)) return false;

            for (int i = 0; i < acadInfoCookie.Length; i++)
            {
                var studentDegree = new StudentDegree()
                {
                    StudentInfoId = int.Parse(studentInfoCookie["Id"]),
                    AdmittedAs = (AdmissionEnum)(int.Parse(acadInfoCookie[i]["AdmittedAs"])),
                    Degree = GetDegree(int.Parse(acadInfoCookie[i]["Degree"])),
                    Id = i,
                    IdStudent = int.Parse(acadInfoCookie[i]["IdStudent"]),
                    YearAdmitted = int.Parse(acadInfoCookie[i]["YearAdmitted"]),
                };
                if (!AddStudentDegree(studentDegree)) return false;
            }

            for (int i = 0; i < mailInfoCookie.Length; i++)
            {
                var mailInfo = new MailingInfo()
                {
                    Id = i,
                    ContactNo = mailInfoCookie[i]["ContactNo"],
                    DeliveryArea = GetDeliveryArea(int.Parse(mailInfoCookie[i]["DeliveryArea"])),
                    MailingAddress = mailInfoCookie[i]["MailingAddress"],
                    StudentInfoId = int.Parse(studentInfoCookie["Id"]),
                    ZipCode = int.Parse(mailInfoCookie[i]["Zipcode"]),
                };
                if (!AddMailingInfo(mailInfo)) return false;
            }
            return true;
        }

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
        
        public Degree GetDegree(int StudentInfoId, String name, int CampusAttended)
        {
            var db = new DBMySqlGetDegreeList();
            db.SetQueryGivenInput((CampusEnum)CampusAttended, name);
            db.ExecuteQuery();
            return db.DegreeList.Length != 0 ? db.DegreeList[0] : null;
        }

        public Degree GetDegree(int degreeId)
        {
            var db = new DBMySqlGetDegreeList();
            db.SetQueryGivenDegreeId(degreeId);
            db.ExecuteQuery();
            return db.DegreeList.Length != 0 ? db.DegreeList[0] : null;
        }

        public Degree[] GetDegree()
        {
            var db = new DBMySqlGetDegreeList();
            db.SetQueryForAllDegree();
            db.ExecuteQuery();
            return db.DegreeList;
        }

        public Degree[] GetDegreeInCampus(int CampusAttended)
        {
            var db = new DBMySqlGetDegreeList();
            db.SetQueryGivenCampus((CampusEnum)CampusAttended);
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
            Debug.Write("\n\n" + db.StudentDegreeList + "\n\n");
            return db.StudentDegreeList;
        }

        public StudentDegree GetOneStudentDegree(int studentDegreeId)
        {
            var db = new DBMySqlGetStudentDegreeList();
            db.SetQueryGivenStudentDegreeId(studentDegreeId);
            db.ExecuteQuery();
            return db.StudentDegreeList[0];
        }

        public StudentDegree[] GetAllStudentDegree()
        {
            var db = new DBMySqlGetStudentDegreeList();
            db.SetQueryForAllStudentDegree();
            db.ExecuteQuery();
            return db.StudentDegreeList;
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