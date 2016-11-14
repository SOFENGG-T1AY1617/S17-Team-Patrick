using System;
using System.Diagnostics;
using System.Web;
using System.Web.UI.WebControls;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Presenter;
using SOFENGG_Order_Request_Document.View.Order.Interface;

namespace SOFENGG_Order_Request_Document.View.Order
{
    public partial class InfoAcadDe : System.Web.UI.Page, IInfoAcadDeView
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.PopulateYear();
                this.PopulateDegreeDropdown();
            }


            try
            {
                if (Request.Cookies["StudentInfo"]["StudentDegreeId"] != null ||
                    Request.Cookies["StudentInfo"]["StudentDegreeId"] != "")
                {
                    PopulatePreviousInput();
                }
            }
            catch (Exception)
            {
                //haven't inputted studentInfo
            }
        }

        private void PopulatePreviousInput()
        {
            //can only be accessed when pressed EDIT
            InfoAcadDePresenter presenter = new InfoAcadDePresenter(this);
            var studentDegreeId = int.Parse(Request.QueryString["StudentDegreeId"]); //<-- GET METHOD
            var studentDegree = presenter.GetOneStudentDegree(studentDegreeId);

            txtStudNo.Text = studentDegree.IdStudent + "";
            ddlCampus.SelectedItem.Selected = false;
            ddlCampus.Items.FindByValue(studentDegree.Degree.CampusOffered.ToString()).Selected = true;
            ddlYearAdmitted.SelectedItem.Selected = false;
            ddlYearAdmitted.Items.FindByText(studentDegree.YearAdmitted.ToString()).Selected = true;
            optLevel.SelectedItem.Selected = false;
            optLevel.Items.FindByValue(studentDegree.Degree.Level.ToString()).Selected = true;
            isGraduate.Checked = false; //<--- wala tayong isGraduate????? -Dyan
            ddlDegree.SelectedItem.Selected = false;
            ddlDegree.Items.FindByText(studentDegree.Degree.Name).Selected = true;
            optAdmittedAs.SelectedItem.Selected = false;
            optAdmittedAs.Items.FindByValue(studentDegree.AdmittedAs.ToString()).Selected = true;
        }

        protected void SubmitStudentDegree_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["StudentInfo"] == null) return;
            StudentInfoId = int.Parse(Request.Cookies["StudentInfo"]["Id"]);
            IdNumber = int.Parse(txtStudNo.Text);
            CampusAttended = int.Parse(ddlCampus.SelectedItem.Value);
            YearAdmitted = int.Parse(ddlYearAdmitted.SelectedItem.Text);
            Level = optLevel.SelectedItem.Value[0];
            IsGraduate = isGraduate.Checked;
            Degree = ddlDegree.SelectedItem.Text;
            AdmittedAs = (int.Parse(optAdmittedAs.SelectedItem.Value) - 1).ToString()[0];

            Debug.Write("\n\n\n[infoAcadDe.aspx] DEGREE: " + Degree);
            
            InfoAcadDePresenter presenter = new InfoAcadDePresenter(this);
            if (presenter.AddStudentDegree())
            {
                Request.Cookies["StudentInfo"]["InfoAcadDe"] = "true";
                Response.Redirect("~/View/Order/InfoAcadConfirm.aspx");
            }
        }

        private void PopulateDegreeDropdown()
        {
            InfoAcadDePresenter presenter = new InfoAcadDePresenter(this);
            var degreeList = presenter.GetAllDegrees();
            for (int i = 0; i < degreeList.Length; i++)
            {
                ddlDegree.Items.Insert(i, new ListItem(degreeList[i].Name, i+""));
            }    
        }

        private void PopulateYear()
        {
            ddlYearAdmitted.Items.Clear();
            ListItem lt = new ListItem();
            lt.Text = "YYYY";
            lt.Value = "0";
            ddlYearAdmitted.Items.Add(lt);
            for (int i = DateTime.Now.Year - 20; i <= DateTime.Now.Year; i++)
            {
                lt = new ListItem();
                lt.Text = i.ToString();
                lt.Value = i.ToString();
                ddlYearAdmitted.Items.Add(lt);
            }
            ddlYearAdmitted.Items.FindByValue(DateTime.Now.Year.ToString()).Selected = true;
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