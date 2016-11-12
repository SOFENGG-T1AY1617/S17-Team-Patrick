using System;
using System.Diagnostics;
using System.Web.UI.WebControls;
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
            }
            
        }

        protected void SubmitStudentDegree_Click(object sender, EventArgs e)
        {
            IdNumber = int.Parse(txtStudNo.Text);
            CampusAttended = int.Parse(ddlCampus.SelectedItem.Value) - 1;
            YearAdmitted = int.Parse(ddlYearAdmitted.SelectedItem.Text);
            Level = (int.Parse(optLevel.SelectedItem.Value) - 1).ToString()[0];
            IsGraduate = isGraduate.Checked;
            Degree = txtDegree.Text;
            AdmittedAs = (int.Parse(optAdmittedAs.SelectedItem.Value) - 1).ToString()[0];

            InfoAcadDePresenter presenter = new InfoAcadDePresenter(this);
            if (presenter.AddStudentDegree())
            {
                Response.Redirect("~/View/Order/InfoMailDe.aspx");
            }
        }

        private void PopulateYear()
        {
            ddlYearAdmitted.Items.Clear();
            ListItem lt = new ListItem();
            lt.Text = "YYYY";
            lt.Value = "0";
            ddlYearAdmitted.Items.Add(lt);
            for (int i = DateTime.Now.Year - 20; i <= DateTime.Now.Year + 20; i++)
            {
                lt = new ListItem();
                lt.Text = i.ToString();
                lt.Value = i.ToString();
                ddlYearAdmitted.Items.Add(lt);
            }
            ddlYearAdmitted.Items.FindByValue(DateTime.Now.Year.ToString()).Selected = true;
        }


        public int IdNumber { get; set; }
        public int CampusAttended { get; set; }
        public char Level { get; set; }
        public bool IsGraduate { get; set; }
        public string Degree { get; set; }
        public char AdmittedAs { get; set; }
        public int YearAdmitted { get; set; }
    }
}