using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Presenter;
using SOFENGG_Order_Request_Document.View.Order.Interface;

namespace SOFENGG_Order_Request_Document.View.Order
{
    public partial class InfoAcadConfirm : System.Web.UI.Page, IInfoAcadDeView
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.Cookies["StudentInfo"]["Id"] == null)
                {
                    Response.Redirect("~/View/Order/Error.aspx");
                }
            }
            catch (NullReferenceException)
            {
                Response.Redirect("~/View/Order/Error.aspx");
            }

            StudentInfoId = int.Parse(Request.Cookies["StudentInfo"]["Id"]);
            DisplayAllStudentDegree();

        }


        private void DisplayAllStudentDegree()
        {
            int studentDegreeNumber = int.Parse(Request.Cookies["StudentInfo"]["StudentDegreeNum"]);
            var admittedAsCookie = Request.Cookies["AcadInformation"]["AdmittedAs"].Split('|');
            var idStudentCookie = Request.Cookies["AcadInformation"]["IdStudent"].Split('|');
            var degreeCookie = Request.Cookies["AcadInformation"]["Degree"].Split('|');
            var yearAdmittedCookie = Request.Cookies["AcadInformation"]["YearAdmitted"].Split('|');
            var idCookie = Request.Cookies["AcadInformation"]["Id"].Split('|');

            InfoAcadDePresenter presenter = new InfoAcadDePresenter(this);
            List<StudentDegree> studentDegreeList = new List<StudentDegree>();
            for (int i = 0; i < studentDegreeNumber; i++)
            {
                var cookie = Request.Cookies["AcadInformation"];
                studentDegreeList.Add(new StudentDegree()
                {
                    AdmittedAs = (AdmissionEnum)int.Parse(admittedAsCookie[i]),
                    IdStudent = int.Parse(idStudentCookie[i]),
                    Degree = presenter.GetOneDegree(int.Parse(degreeCookie[i])),
                    YearAdmitted = int.Parse(yearAdmittedCookie[i]),
                    Id = int.Parse(idCookie[i]),
                    StudentInfoId = int.Parse(Request.Cookies["StudentInfo"]["Id"])

                });
            }
            if (studentDegreeList.Count == 0)
            {
                Response.Redirect("~/View/Order/InfoAcadDe.aspx");
            }

            rptInfoAcadConfirm.DataSource = studentDegreeList;
            rptInfoAcadConfirm.DataBind();
        }

        /* CLICK EVENTS */

        protected void GoToInfoMailDe(object sender, EventArgs e)
        {
            Response.Redirect("~/View/Order/InfoMailDe.aspx");
        }

        protected void DeleteStudentDegree(object sender, EventArgs e)
        {
            Button button = sender as Button;
            
            var idControl = button.Parent.FindControl("updateBtns") as HiddenField;
            var index = int.Parse(idControl.Value);

            InfoAcadDePresenter presenter = new InfoAcadDePresenter(this);
            HttpCookie cookie = presenter.DeleteAcadInfo(Request.Cookies["AcadInformation"], index);
            Response.Cookies.Add(cookie);

            HttpCookie studentInfoCookie = Request.Cookies["StudentInfo"];
            studentInfoCookie["StudentDegreeNum"] = (int.Parse(Request.Cookies["StudentInfo"]["StudentDegreeNum"]) - 1) + "";
            Response.Cookies.Add(studentInfoCookie);

            DisplayAllStudentDegree();
            Response.Redirect("~/View/Order/InfoAcadConfirm.aspx");

            
            

        }

        protected void EditStudentDegree(object sender, EventArgs e)
        {
            Button button = sender as Button;
            var idControl = button.Parent.FindControl("updateBtns") as HiddenField;
            HttpCookie editCookie = new HttpCookie("EditCookie");
            editCookie["Id"] = idControl.Value;
            Response.Cookies.Add(editCookie);
            Response.Redirect("~/View/Order/InfoAcadDe.aspx");
        }

        public void AddStudentDegree(object sender, EventArgs e)
        {
            Response.Redirect("~/View/Order/InfoAcadDe.aspx");
        }

        public int StudentInfoId { get; set; }
        public int IdNumber { get; set; }
        public int CampusAttended { get; set; }
        public char Level { get; set; }
        public bool IsGraduate { get; set; }
        public string Degree { get; set; }
        public char AdmittedAs { get; set; }
        public int YearAdmitted { get; set; }
        public StudentDegree[] StudentDegreeList { get; set; }
    }
}