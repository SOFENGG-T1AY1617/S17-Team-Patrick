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
    public class InfoAcadDePresenter
    {
        IInfoAcadDeView view;
        UserModel model;

        public InfoAcadDePresenter(IInfoAcadDeView view)
        {
            model = new UserModel();
            this.view = view;
        }


        public HttpCookie AddAcadInfoCookie(int studentInfoId, int AcadId)
        {   

            StudentDegree[] degreeList = model.GetStudentDegree(studentInfoId);
            HttpCookie cookie;
            int acadInfoId = AcadId;
            cookie = new HttpCookie("AcadInformation" + acadInfoId);
            cookie["AdmittedAs"] = (int)((AdmissionEnum) view.AdmittedAs) + "";
            cookie["Degree"] = model.GetDegree(view.StudentInfoId, view.Degree, view.CampusAttended).Id + "";
            cookie["IdStudent"] = view.IdNumber + "";
            cookie["YearAdmitted"] = view.YearAdmitted + "";

            return cookie;
        }

        public bool AddStudentDegree()
        {   
            StudentDegree studentDegree = new StudentDegree()
            {
                StudentInfoId = view.StudentInfoId,
                AdmittedAs = (AdmissionEnum)view.AdmittedAs,
                Degree = model.GetDegree(view.StudentInfoId, view.Degree, view.CampusAttended),
                IdStudent = view.IdNumber,
                YearAdmitted = view.YearAdmitted,
            };

            return model.AddStudentDegree(studentDegree);

        }
        

        public StudentDegree[] GetStudentDegreeList()
        {
            return model.GetStudentDegree(view.StudentInfoId);
        }

        public StudentDegree GetOneStudentDegree(int studentDegreeId)
        {
            return model.GetOneStudentDegree(studentDegreeId);
        }

        public Degree[] GetAllDegrees()
        {
            return model.GetDegree();
        }

        public Degree[] GetDegreeInCampus(int campusAttended)
        {
            return model.GetDegreeInCampus(campusAttended);
        }

        public Degree GetOneDegree(int degreeId)
        {
            return model.GetDegree(degreeId);
        }
    }
}