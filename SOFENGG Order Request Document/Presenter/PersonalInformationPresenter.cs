
using System;
using System.Collections.Generic;
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
        

    }
}