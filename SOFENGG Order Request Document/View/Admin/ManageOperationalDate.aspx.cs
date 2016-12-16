using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Presenter.Admin;
using SOFENGG_Order_Request_Document.View.Admin.Interface;

namespace SOFENGG_Order_Request_Document.View.Admin
{
    public partial class ManageOperationalDate : System.Web.UI.Page, IManageOperationalDateView
    {
        private ManageOperationalDatePresenter _presenter;

        public ManageOperationalDate()
        {
            _presenter = new ManageOperationalDatePresenter(this);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                ProcessAjaxPostBack();
                return;
            }

            GetOfflineDates();
        }

        private void ProcessAjaxPostBack()
        {
            var sControlName = Request.Params.Get("__EVENTTARGET");
            var sParameter = Request.Params.Get("__EVENTARGUMENT");

            if (string.IsNullOrEmpty(sControlName) || string.IsNullOrEmpty(sParameter))
                return;

            if (sControlName == upAddButton.ClientID)
            {
                AddDate(DateTime.Parse(sParameter.Trim()));
            }
            else if (sControlName == upDeleteYesButton.ClientID)
            {
                RemoveOfflineDate(DateTime.Parse(sParameter.Trim()));
            }
        }

        public void AddDate(DateTime date)
        {
            var userCookie = Request.Cookies[Personel.Table];

            var offline = new Offline
            {
                Date = date,
                Personel = new Personel
                {
                    Id = int.Parse(userCookie[Personel.ColId])
                }
            };

            _presenter.AddOfflineDate(offline);
            cmdUpOfflineDates.Text = DateTime.Now.ToLongTimeString();
            GetOfflineDates();
            upOfflineDates.Update();
        }

        public void GetOfflineDates()
        {
            repOfflineDates.DataSource = _presenter.GetOfflineDateList();
            repOfflineDates.DataBind();
        }

        public static bool IsWeekend(DateTime date)
        {
            return date.DayOfWeek == DayOfWeek.Saturday || date.DayOfWeek == DayOfWeek.Sunday;
        }

        public void RemoveOfflineDate(DateTime date)
        {
            _presenter.DeleteOfflineDate(date);
            cmdUpOfflineDates.Text = DateTime.Now.ToLongTimeString();
            GetOfflineDates();
            upOfflineDates.Update();
        }
    }
}