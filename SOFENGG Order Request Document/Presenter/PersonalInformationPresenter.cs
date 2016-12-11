
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Database;
using SOFENGG_Order_Request_Document.View.Order.Interface;

namespace SOFENGG_Order_Request_Document.Presenter
{
    public class PersonalInformationPresenter
    {
        IPersonalInformationView view;
        UserModel model;
        public PersonalInformationPresenter(IPersonalInformationView view)
        {
            model = new UserModel();
            this.view = view;
        }


        public HttpCookie AddPersonalInformation()
        {
            HttpCookie cookie;
            cookie = new HttpCookie("StudentInfo");

            cookie["LastName"] = view.LastName;
            cookie["FirstName"] = view.FirstName;
            cookie["MiddleName"] = view.MiddleName;
            cookie["Gender"] = ((GenderEnum) view.Gender).ToString();
            cookie["BirthDate"] = view.BirthDate.ToString();
            cookie["Citizenship"] = view.Citizenship;
            cookie["CurrentAddress"] = view.CurrentAddress;
            cookie["PhoneNumber"] = view.PhoneNumber;
            cookie["Email"] = view.EmailAddress;
            cookie["HighSchoolAttended"] = view.HighSchoolAttended;
            cookie["PlaceOfBirth"] = view.PlaceOfBirth;
            cookie["Id"] = (model.GetMyStudentInfo().StudentInfoId + 1) + "";
            cookie["StudentDegreeNum"] = 0 + "";
            cookie["MailingInfoNum"] = 0 + "";

            return cookie;
        }
        

        public bool AddStudentInfo()
        {
            StudentInfo studentInfo = new StudentInfo();
            studentInfo.LastName = view.LastName;
            studentInfo.FirstName = view.FirstName;
            studentInfo.MiddleName = view.MiddleName;
            studentInfo.Gender = (GenderEnum)view.Gender;
            studentInfo.BirthDate = view.BirthDate;
            studentInfo.Citizenship = view.Citizenship;
            studentInfo.CurrentAddress = view.CurrentAddress;
            studentInfo.PhoneNumber = view.PhoneNumber;
            studentInfo.Email = view.EmailAddress;
            studentInfo.HighSchoolAttended = view.HighSchoolAttended;
            studentInfo.PlaceOfBirth = view.PlaceOfBirth;

            
            return model.AddStudentInfo(studentInfo); ;
        }

        public StudentInfo GetMyStudentInfo(int studentInfoId)
        {
            return model.GetMyStudentInfo(studentInfoId);
        }

        public StudentInfo GetMyStudentInfo()
        {
            return model.GetMyStudentInfo();
        }

        public bool EditStudentInfo()
        {
            StudentInfo studentInfo = new StudentInfo();
            studentInfo.StudentInfoId = view.StudentInfoId;
            studentInfo.LastName = view.LastName;
            studentInfo.FirstName = view.FirstName;
            studentInfo.MiddleName = view.MiddleName;
            studentInfo.Gender = (GenderEnum)view.Gender;
            studentInfo.BirthDate = view.BirthDate;
            studentInfo.Citizenship = view.Citizenship;
            studentInfo.CurrentAddress = view.CurrentAddress;
            studentInfo.PhoneNumber = view.PhoneNumber;
            studentInfo.Email = view.EmailAddress;
            studentInfo.HighSchoolAttended = view.HighSchoolAttended;
            studentInfo.PlaceOfBirth = view.PlaceOfBirth;

            return model.EditStudentInfo(studentInfo);
        }
        

    }
}