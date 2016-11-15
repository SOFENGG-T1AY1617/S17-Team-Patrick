using System;
using System.Diagnostics;
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
            get { return (Model.Order[])repOrders.DataSource; }
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
        public Model.Order ActiveOrder { get; set; }
        public OrderItemGroup[] OrderItemGroup { get; set; }

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
            if (Page.IsPostBack)
            {
                ProcessAjaxPostBack();
                return;
            }

            GetOrderList();
        }

        #endregion

        public void GetOrderList()
        {
            _presenter.GetOrderList();
            UpdateCountLabels();
        }

        public void GetOrderInformation(int referenceNo)
        {
            _presenter.GetOrderInformation(referenceNo);
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

        #region Ajax Post Back

        private void ProcessAjaxPostBack()
        {
            var sControlName = Request.Params.Get("__EVENTTARGET");
            var sParameter = Request.Params.Get("__EVENTARGUMENT");

            if (string.IsNullOrEmpty(sControlName) || string.IsNullOrEmpty(sParameter))
                return;

            if (sControlName == "cmdUpdateOrderInformation")
            {
                lblActiveReferenceNo.Text = sParameter;
                GetOrderInformation(int.Parse(sParameter));
                lblActiveOrderName.Text = ActiveOrder.Receiver.FirstName + " " +
                                          (!string.IsNullOrEmpty(ActiveOrder.Receiver.MiddleName)
                                              ? ActiveOrder.Receiver.MiddleName + " "
                                              : "") + ActiveOrder.Receiver.LastName;
                lblActiveOrderAddress.Text = ActiveOrder.Receiver.CurrentAddress;
                lblActiveOrderPhoneNumber.Text = ActiveOrder.Receiver.PhoneNumber;
                lblActiveOrderPlaceOfBirth.Text = ActiveOrder.Receiver.PlaceOfBirth;
                lblActiveOrderEmail.Text = ActiveOrder.Receiver.Email;

                repOrderMailingInfo.DataSource = OrderItemGroup;
                repOrderMailingInfo.DataBind();

                var referenceNo = int.Parse(sParameter);
                var status = _presenter.GetOrderStatus(referenceNo);

                btnMarkProcessing.Visible = status != OrderStatusEnum.Processing;
                btnMarkDone.Visible = status != OrderStatusEnum.OnTime && status != OrderStatusEnum.Late;
                btnMarkPending.Visible = status != OrderStatusEnum.Pending;
            }
        }

        #endregion
    }
}