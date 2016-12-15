using System;
using System.Diagnostics;
using System.Drawing;
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
            // ========== DEBUG MODE. PLEASE ERASE THIS AFTER ============= //
            if (Request.Cookies["StudentInfo"] == null)
            {
                HttpCookie studentInfo = new HttpCookie("StudentInfo");
                studentInfo["Id"] = "8";
                studentInfo["StudentDegreeNum"] = 0 + "";
                Response.Cookies.Add(studentInfo);
            }

            try
            {
                if (!IsPostBack)
                {
                    this.PopulateYear();
                    ddlDegree.Items.Insert(0, "");
                    ddlDegree.Enabled = false;
                }

                if (Request.Cookies["StudentInfo"]["Id"] == null)
                {
                    Response.Redirect("~/View/Order/Error.aspx");
                }
            }
            catch (NullReferenceException)
            {
                Response.Redirect("~/View/Order/Error.aspx");
            }

            try
            {
                if (!IsPostBack){
                    if (Request.Cookies["EditCookie"]["Id"] != null){
                        PopulatePreviousInput(int.Parse(Request.Cookies["EditCookie"]["Id"]));
                    }
                }
            }catch (NullReferenceException) { }
            
            

            
           
        }

        public void DDLCampus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCampus.SelectedIndex == 0)
            {
                ddlDegree.Enabled = false;
                ddlDegree.Attributes.Add("bgcolor", "gray");
            }
            else
                ddlDegree.Enabled = true;

            this.PopulateDegreeDropdown();

            upDegree.Update();
        }



        private void PopulatePreviousInput(int i)
        {
            //can only be accessed when pressed EDIT
            var admittedAsCookie = Request.Cookies["AcadInformation"]["AdmittedAs"].Split('|');
            var idStudentCookie = Request.Cookies["AcadInformation"]["IdStudent"].Split('|');
            var degreeCookie = Request.Cookies["AcadInformation"]["Degree"].Split('|');
            var yearAdmittedCookie = Request.Cookies["AcadInformation"]["YearAdmitted"].Split('|');
            var idCookie = Request.Cookies["AcadInformation"]["Id"].Split('|');
            
            InfoAcadDePresenter presenter = new InfoAcadDePresenter(this);
            
            txtStudNo.Text = idStudentCookie[i];
            ddlCampus.SelectedItem.Selected = false;
            ddlCampus.Items.FindByText(presenter.GetOneDegree(int.Parse(degreeCookie[i])).CampusOffered.ToString()).Selected = true;
            ddlYearAdmitted.SelectedItem.Selected = false;
            ddlYearAdmitted.Items.FindByText(yearAdmittedCookie[i]).Selected = true;
            PopulateDegreeDropdown();
            ddlDegree.SelectedItem.Selected = false;
            ddlDegree.Items.FindByText(presenter.GetOneDegree(int.Parse(degreeCookie[i])).Name).Selected = true;
            optAdmittedAs.Items.FindByValue(int.Parse(admittedAsCookie[i]).ToString()).Selected = true;
        }

        protected void SubmitStudentDegree_Click(object sender, EventArgs e)
        {

            if (Request.Cookies["StudentInfo"] == null) return;
            StudentInfoId = int.Parse(Request.Cookies["StudentInfo"]["Id"]);
            IdNumber = int.Parse(txtStudNo.Text);
            CampusAttended = int.Parse(ddlCampus.SelectedItem.Value);
            YearAdmitted = int.Parse(ddlYearAdmitted.SelectedItem.Text);
            Degree = ddlDegree.SelectedItem.Text;
            AdmittedAs = (char)int.Parse(optAdmittedAs.SelectedItem.Value);

            int editInfoId = 0;
            try
            {
                editInfoId = int.Parse(Request.Cookies["EditCookie"]["Id"]);
                HttpCookie editCookie = new HttpCookie("EditCookie");
                editCookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(editCookie);
            }
            catch (NullReferenceException)
            {
                editInfoId = int.Parse(Request.Cookies["StudentInfo"]["StudentDegreeNum"]);
                HttpCookie studentCookie = Request.Cookies["StudentInfo"];
                int studentDegreeNum = int.Parse(studentCookie["StudentDegreeNum"]) + 1;
                studentCookie["StudentDegreeNum"] = studentDegreeNum.ToString();
                Response.Cookies.Add(studentCookie);
            }
            
            InfoAcadDePresenter presenter = new InfoAcadDePresenter(this);
            HttpCookie acadCookie;
            if (Request.Cookies["AcadInformation"] != null)
                acadCookie = Request.Cookies["AcadInformation"];
            else acadCookie = null;
            HttpCookie acadInfoCookie = presenter.AddAcadInfoCookie(acadCookie, editInfoId);
            Response.Cookies.Add(acadInfoCookie);
            Response.Redirect("~/View/Order/InfoAcadConfirm.aspx");
        }

        private void PopulateDegreeDropdown()
        {
            InfoAcadDePresenter presenter = new InfoAcadDePresenter(this);
            var degreeList = presenter.GetDegreeInCampus(int.Parse(ddlCampus.SelectedItem.Value));
            Debug.Write("\n\n" + ddlCampus.SelectedItem.Value + "\n\n");
            ddlDegree.Items.Clear();
            ddlDegree.Items.Insert(0, "Select degree");
            for (int i = 1; i <= degreeList.Length; i++)
            {
                ddlDegree.Items.Insert(i, new ListItem(degreeList[i-1].Name, i + ""));
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