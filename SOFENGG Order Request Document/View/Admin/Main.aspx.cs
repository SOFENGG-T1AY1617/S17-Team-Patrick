using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Database;
using SOFENGG_Order_Request_Document.Model.Helper;
using SOFENGG_Order_Request_Document.Presenter.Admin;
using SOFENGG_Order_Request_Document.View.Admin.Interface;

namespace SOFENGG_Order_Request_Document.View.Admin
{
    public partial class Main : Page, IOrderListView
    {

        private readonly ViewOrderListPresenter _presenter;

        public Model.Order[] OrderList
        {
            set
            {
                repOrders.DataSource = value;
                repOrders.DataBind();
            }
        }

        public int ProcessingCount { get; set; }
        public int PendingCount { get; set; }
        public int OnTimeCount { get; set; }
        public int LateCount { get; set; }
        public int TotalCount { get; set; }

        #region Initialization Functions

        public Main()
        {
            _presenter = new ViewOrderListPresenter(this);
        }

        protected void repDoc_OnItemCreated(object sender, RepeaterItemEventArgs e)
        {
            var sm = ScriptManager.GetCurrent(this);
            if (sm == null)
                return;

//            sm.RegisterAsyncPostBackControl(btnAdd);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            GetOrderList();
        }

        #endregion

        public void GetOrderList()
        {
            _presenter.GetOrderList();
            UpdateCountLabels();
        }

        protected void UpdateCountLabels()
        {
            lblProcessingCount.Text = ProcessingCount.ToString();
            lblPendingCount.Text = PendingCount.ToString();
            lblOnTimeCount.Text = OnTimeCount.ToString();
            lblLateCount.Text = LateCount.ToString();
            lblTotalCount.Text = TotalCount.ToString();
        }

        #region UI Formatters
        protected string SetRowClass(OrderStatusEnum statusType)
        {
            switch (statusType)
            {
                case OrderStatusEnum.Processing:
                    return "";
                case OrderStatusEnum.Pending:
                    return "warning";
                case OrderStatusEnum.Late:
                    return "danger";
                case OrderStatusEnum.OnTime:
                    return "success";
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }
        #endregion
    }
}