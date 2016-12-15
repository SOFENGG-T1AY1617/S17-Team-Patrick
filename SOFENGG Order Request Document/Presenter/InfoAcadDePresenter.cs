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


        public HttpCookie DeleteAcadInfo(HttpCookie acadCookie, int deleteId)
        {
            var idString = acadCookie["Id"].Split('|');
            var admittedString = acadCookie["AdmittedAs"].Split('|');
            var degreeString = acadCookie["Degree"].Split('|');
            var idStudentString = acadCookie["IdStudent"].Split('|');
            var yearString = acadCookie["YearAdmitted"].Split('|');

            acadCookie["Id"] = "";
            acadCookie["AdmittedAs"] = "";
            acadCookie["Degree"] = "";
            acadCookie["IdStudent"] = "";
            acadCookie["YearAdmitted"] = "";

            var str = "|";

            for (int i = 0; i < idString.Length; i++)
            {
                if (i == idString.Length - 1) str = "";
                if (i == deleteId) continue;
                acadCookie["Id"] += idString[i] + str;
                acadCookie["AdmittedAs"] += admittedString[i] + str;
                acadCookie["Degree"] += degreeString[i] + str;
                acadCookie["IdStudent"] += idStudentString[i] + str;
                acadCookie["YearAdmitted"] += yearString[i] + str;
            }

            return acadCookie;
  ;      }
        
        public HttpCookie AddAcadInfoCookie(HttpCookie acadCookie, int editId)
        {   
            try
            {
                var idString = acadCookie["Id"].Split('|');
                var admittedString = acadCookie["AdmittedAs"].Split('|');
                var degreeString = acadCookie["Degree"].Split('|');
                var idStudentString = acadCookie["IdStudent"].Split('|');
                var yearString = acadCookie["YearAdmitted"].Split('|');

                acadCookie["Id"] = "";
                acadCookie["AdmittedAs"] = "";
                acadCookie["Degree"] = "";
                acadCookie["IdStudent"] = "";
                acadCookie["YearAdmitted"] = "";

                var str = "|";
                var acadInfoNum = idString.Length;
                if (editId == idString.Length)
                    acadInfoNum += 1;

                for (int i = 0; i < acadInfoNum; i++)
                {
                    if (i == acadInfoNum - 1) str = "";

                    if (i != editId)
                    {
                        acadCookie["Id"] += idString[i] + str;
                        acadCookie["AdmittedAs"] +=  admittedString[i] + str;
                        acadCookie["Degree"] +=  degreeString[i] + str;
                        acadCookie["IdStudent"] +=  idStudentString[i] + str;
                        acadCookie["YearAdmitted"] +=  yearString[i] + str;
                    }
                    else
                    {
                        acadCookie["Id"] += i + str;
                        acadCookie["AdmittedAs"] +=  (int)((AdmissionEnum)view.AdmittedAs) + str;
                        acadCookie["Degree"] += model.GetDegree(view.StudentInfoId, view.Degree, view.CampusAttended).Id + str;
                        acadCookie["IdStudent"] +=  view.IdNumber + str;
                        acadCookie["YearAdmitted"] +=  view.YearAdmitted + str;
                    }
                }
                
            }
            catch (NullReferenceException)
            {
                acadCookie = new HttpCookie("AcadInformation");
                acadCookie["Id"] = 0 + "";
                acadCookie["AdmittedAs"] = (int) ((AdmissionEnum) view.AdmittedAs) + "";
                acadCookie["Degree"] = model.GetDegree(view.StudentInfoId, view.Degree, view.CampusAttended).Id + "";
                acadCookie["IdStudent"] = view.IdNumber + "";
                acadCookie["YearAdmitted"] = view.YearAdmitted + "";
            }
            
            return acadCookie;
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