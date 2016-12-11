﻿using System;
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

            try
            {
                if (!IsPostBack)
                {
                    this.PopulateYear();
                    ddlDegree.Items.Insert(0, "Select Campus");
                    //this.PopulateDegreeDropdown();
                }

                if (ddlCampus.SelectedIndex == 0)
                    ddlDegree.Enabled = false;

                if (Request.Cookies["StudentInfo"]["Id"] == null)
                {
                    Response.Redirect("~/View/Order/Error.aspx");
                }
            }
            catch (NullReferenceException)
            {
                Response.Redirect("~/View/Order/Error.aspx");
            }

            
           
        }

        public void DDLCampus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCampus.SelectedIndex == 0)
                ddlDegree.Enabled = false;
            else
                ddlDegree.Enabled = true;

            this.PopulateDegreeDropdown();
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
            Degree = ddlDegree.SelectedItem.Text;
            AdmittedAs = (char)int.Parse(optAdmittedAs.SelectedItem.Value);
            
            
            InfoAcadDePresenter presenter = new InfoAcadDePresenter(this);
            HttpCookie acadInfoCookie = presenter.AddAcadInfoCookie(int.Parse(Request.Cookies["StudentInfo"]["Id"]),
                                                                    int.Parse(Request.Cookies["StudentInfo"]["StudentDegreeNum"]));
            Response.Cookies.Add(acadInfoCookie);
            HttpCookie studentCookie = Request.Cookies["StudentInfo"];
            int studentDegreeNum = int.Parse(studentCookie["StudentDegreeNum"]) + 1;
            studentCookie["StudentDegreeNum"] = studentDegreeNum.ToString();
            Response.Cookies.Add(studentCookie);
            Response.Redirect("~/View/Order/InfoAcadConfirm.aspx");
        }

        private void PopulateDegreeDropdown()
        {
            InfoAcadDePresenter presenter = new InfoAcadDePresenter(this);
            var degreeList = presenter.GetDegreeInCampus(int.Parse(ddlCampus.SelectedItem.Value));
            ddlDegree.Items.Clear();
            ddlDegree.Items.Insert(0, "Select Campus");
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