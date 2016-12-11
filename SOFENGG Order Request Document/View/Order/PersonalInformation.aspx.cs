using System;
using System.Diagnostics;
using System.Web;
using System.Web.UI.WebControls;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.View.Order.Interface;
using SOFENGG_Order_Request_Document.Presenter;

namespace SOFENGG_Order_Request_Document.View.Order
{
    public partial class PersonalInformation : System.Web.UI.Page, IPersonalInformationView
    {
        public int StudentInfoId { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public int Gender { get; set; }
        public DateTime BirthDate { get; set; }
        public string Citizenship { get; set; }
        public string CurrentAddress { get; set; }
        public string PhoneNumber { get; set; }
        public string EmailAddress { get; set; }
        public string HighSchoolAttended { get; set; }
        public string PlaceOfBirth { get; set; }

        private int Day
        {
            get
            {
                if (Request.Form[ddlBirthDay.UniqueID] != null)
                {
                    return int.Parse(Request.Form[ddlBirthDay.UniqueID]);
                }
                else
                {
                    return int.Parse(ddlBirthDay.SelectedItem.Value);
                }
            }
            set
            {
                this.PopulateDay();
                ddlBirthDay.ClearSelection();
                ddlBirthDay.Items.FindByValue(value.ToString()).Selected = true;
            }
        }
        private int Month
        {
            get
            {
                return int.Parse(ddlBirthMonth.SelectedItem.Value);
            }
            set
            {
                this.PopulateMonth();
                ddlBirthMonth.ClearSelection();
                ddlBirthMonth.Items.FindByValue(value.ToString()).Selected = true;
            }
        }
        private int Year
        {
            get
            {
                return int.Parse(ddlBirthYear.SelectedItem.Value);
            }
            set
            {
                this.PopulateYear();
                ddlBirthYear.ClearSelection();
                ddlBirthYear.Items.FindByValue(value.ToString()).Selected = true;
            }
        }
        public DateTime SelectedDate
        {
            get
            {
                try
                {
                    return DateTime.Parse(this.Month + "/" + this.Day + "/" + this.Year);
                }
                catch
                {
                    return DateTime.MinValue;
                }
            }
            set
            {
                if (!value.Equals(DateTime.MinValue))
                {
                    this.Year = value.Year;
                    this.Month = value.Month;
                    this.Day = value.Day;
                }
            }
        }

        private void PopulatePreviousInput()
        {
            PersonalInformationPresenter presenter = new PersonalInformationPresenter(this);
            //get StudentInfo from presenter.GetStudentInfo();
            //populate all txtBox etc etc
            //change all StudentInfo 
            HttpCookie cookie = Request.Cookies["StudentInfo"];
            Debug.Write("HIHIHI");
            txtLName.Text = cookie["LastName"];
            txtFName.Text = cookie["FirstName"];
            txtMName.Text = cookie["MiddleName"];
            
            optGender.SelectedValue = (char)int.Parse(cookie["Gender"]) + "";
            ddlBirthMonth.Items.FindByValue(cookie["BirthDate"].Substring(0, 1));
            txtCitizen.Text = cookie["Citizenship"];
            txtCurrentAddress.Text = cookie["CurrentAddress"];
            txtPhoneNum.Text = cookie["PhoneNumber"];
            txtEmail.Text = cookie["Email"];
            txtHSAttended.Text = cookie["HighSchoolAttended"];
            txtBirthplace.Text = cookie["PlaceOfBirth"];
            ddlBirthMonth.Items.FindByValue(DateTime.Now.Month.ToString()).Selected = false;
            ddlBirthMonth.Items.FindByValue(int.Parse(cookie["BirthDate"].Substring(3, 2)) + "").Selected = true;
            ddlBirthDay.Items.FindByValue(DateTime.Now.Day.ToString()).Selected = false;
            ddlBirthDay.Items.FindByValue(int.Parse(cookie["BirthDate"].Substring(0, 2)) + "").Selected = true;
            ddlBirthYear.Items.FindByValue(DateTime.Now.Year.ToString()).Selected = false;
            ddlBirthYear.Items.FindByValue(int.Parse(cookie["BirthDate"].Substring(6, 4)) + "").Selected = true;

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (this.SelectedDate == DateTime.MinValue)
                {
                    this.PopulateYear();
                    this.PopulateMonth();
                    this.PopulateDay();
                }


                try
                {
                    //Request.Cookies["StudentInfo"]["Id"] = "19";

                    if (Request.Cookies["StudentInfo"] != null)
                    {
                        PopulatePreviousInput();
                    }
                }
                catch (Exception)
                {
                }

            }
            else
            {
                if (Request.Form[ddlBirthDay.UniqueID] != null)
                {
                    this.PopulateDay();
                    ddlBirthDay.ClearSelection();
                    ddlBirthDay.Items.FindByValue(Request.Form[ddlBirthDay.UniqueID]).Selected = true;
                }
            }


        }

        protected void SubmitPersonalInformation_Click(object sender, EventArgs e)
        {
            LastName = txtLName.Text;
            FirstName = txtFName.Text;
            MiddleName = txtMName.Text;
            Gender = (char)optGender.SelectedItem.Value[0];
            var month = Convert.ToDateTime(ddlBirthMonth.SelectedItem.Text + " 01, 1900").Month;
            var year = ddlBirthYear.SelectedItem.Text;
            var day = ddlBirthDay.SelectedItem.Text;
            BirthDate = Convert.ToDateTime(day + "/" + month + "/" + year).Date;
            Citizenship = txtCitizen.Text;
            CurrentAddress = txtCurrentAddress.Text;
            PhoneNumber = txtPhoneNum.Text;
            EmailAddress = txtEmail.Text;
            HighSchoolAttended = txtHSAttended.Text;
            PlaceOfBirth = txtBirthplace.Text;

            PersonalInformationPresenter presenter = new PersonalInformationPresenter(this);
            HttpCookie personalInfoCookie = presenter.AddPersonalInformation();
            Response.Cookies.Add(personalInfoCookie);

            Response.Redirect("~/View/Order/InfoAcadDe.aspx");
 
        }   

        public void Submit()
        {
            throw new NotImplementedException();
        }


        private void PopulateDay()
        {
            ddlBirthDay.Items.Clear();
            ListItem lt = new ListItem();
            lt.Text = "DD";
            lt.Value = "0";
            ddlBirthDay.Items.Add(lt);
            int days = DateTime.DaysInMonth(this.Year, this.Month);
            for (int i = 1; i <= days; i++)
            {
                lt = new ListItem();
                lt.Text = i.ToString();
                lt.Value = i.ToString();
                ddlBirthDay.Items.Add(lt);
            }
            ddlBirthDay.Items.FindByValue(DateTime.Now.Day.ToString()).Selected = true;
        }

        private void PopulateMonth()
        {
            ddlBirthMonth.Items.Clear();
            ListItem lt = new ListItem();
            lt.Text = "MM";
            lt.Value = "0";
            ddlBirthMonth.Items.Add(lt);
            for (int i = 1; i <= 12; i++)
            {
                lt = new ListItem();
                lt.Text = Convert.ToDateTime("1/"+ i.ToString()+"/1900").ToString("MMMM");
                lt.Value = i.ToString();
                ddlBirthMonth.Items.Add(lt);
            }
            ddlBirthMonth.Items.FindByValue(DateTime.Now.Month.ToString()).Selected = true;
        }

        private void PopulateYear()
        {
            ddlBirthYear.Items.Clear();
            ListItem lt = new ListItem();
            lt.Text = "YYYY";
            lt.Value = "0";
            ddlBirthYear.Items.Add(lt);
            for (int i = DateTime.Now.Year; i >= 1950; i--)
            {
                lt = new ListItem();
                lt.Text = i.ToString();
                lt.Value = i.ToString();
                ddlBirthYear.Items.Add(lt);
            }
            ddlBirthYear.Items.FindByValue(DateTime.Now.Year.ToString()).Selected = true;
        }
    }
}