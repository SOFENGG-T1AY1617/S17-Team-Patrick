using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Presenter.Admin;
using SOFENGG_Order_Request_Document.View.Admin.Interface;

namespace SOFENGG_Order_Request_Document.View.Admin
{
    public partial class Login : System.Web.UI.Page, ILoginView
    {
        private LoginPresenter _presenter;

        public Login()
        {
            _presenter = new LoginPresenter(this);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                ProcessAjaxPostBack();
                return;
            }

            var userCookie = Request[Personel.Table];

            if (userCookie != null)
                Response.Redirect("~/View/Admin/Main.aspx");
        }

        private void ProcessAjaxPostBack()
        {
            var sControlName = Request.Params.Get("__EVENTTARGET");
            var sParameter = Request.Params.Get("__EVENTARGUMENT");

            if (string.IsNullOrEmpty(sControlName) || string.IsNullOrEmpty(sParameter))
                return;

            if (sControlName == "cmdLogin")
            {
                LoginUser();
            }

        }

        public void LoginUser()
        {
            var user = _presenter.Login(txtEmail.Text.Trim(), txtPassword.Text.Trim());

            if (user == null)
                return;

            var userCookie = new HttpCookie(Personel.Table) {Expires = DateTime.Now.AddDays(365)};
            Response.Cookies.Add(userCookie);

            userCookie[Personel.ColId] = user.Id + "";
            userCookie[Personel.ColFirstName] = user.FirstName;
            userCookie[Personel.ColLastName] = user.LastName;

            Response.Redirect("~/View/Admin/Main.aspx");
        }
    }
}