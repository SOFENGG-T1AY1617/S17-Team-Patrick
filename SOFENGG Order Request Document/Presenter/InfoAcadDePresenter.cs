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

        public bool AddStudentDegree()
        {   
            StudentDegree studentDegree = new StudentDegree()
            {
                StudentInfoId = view.StudentInfoId,
                AdmittedAs = (AdmissionEnum)view.AdmittedAs,
                Degree = model.GetDegree(view.StudentInfoId, view.Degree, view.CampusAttended, view.Level),
                IdStudent = view.IdNumber,
                YearAdmitted = view.YearAdmitted,
            };

            return model.AddStudentDegree(studentDegree);

        }

        public StudentDegree[] GetStudentDegree()
        {
            var db = new DBMySqlGetStudentDegreeList();
            db.StudentInfoId = view.StudentInfoId;
            db.ExecuteQuery();
            return db.StudentDegreeList;
        }

    }
}