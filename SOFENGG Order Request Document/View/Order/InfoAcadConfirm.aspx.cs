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
            StudentInfoId = int.Parse(Request.Cookies["StudentInfo"]["Id"]);
            DisplayAllStudentDegree();
        }


        private void DisplayAllStudentDegree()
        {
            InfoAcadDePresenter presenter = new InfoAcadDePresenter(this);
            StudentDegree[] studentDegree = presenter.GetStudentDegreeList();
            List<StudentDegree> studentDegreeList = new List<StudentDegree>();
            for (int i = 0; i < studentDegree.Length; i++)
            {
                studentDegreeList.Add(studentDegree[i]);
            }

            rptInfoAcadConfirm.DataSource = studentDegreeList;
            rptInfoAcadConfirm.DataBind();
        }

        /* CLICK EVENTS */

        protected void GoToInfoMailDe(object sender, EventArgs e)
        {
            Request.Cookies["StudentInfo"]["StudentDegreeId"] = "";
            Response.Redirect("~/View/Order/InfoMailDe.aspx");
        }

        protected void DeleteStudentDegree(object sender, EventArgs e)
        {
            Button btn = sender as Button;

        }

        protected void EditStudentDegree(object sender, EventArgs e)
        {
        }

        public void AddStudentDegree(object sender, EventArgs e)
        {
            Request.Cookies["StudentInfo"]["StudentDegreeId"] = "";
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