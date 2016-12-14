using System;
using System.Diagnostics;
using System.Net.Mail;
using System.Web.Script.Serialization;
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
                cmdUpdateOrderList.Text = DateTime.Now.ToLongTimeString();
                upOrderList.Update();
            }
        }

        public int ProcessingCount { get; set; }
        public int PendingCount { get; set; }
        public int OnTimeCount { get; set; }
        public int LateCount { get; set; }
        public int TotalCount { get; set; }
        public Model.Order ActiveOrder { get; set; }
        public OrderItemGroup[] ActiveOrderItemList { get; set; }

        #region Initialization Functions

        public static class Functions
        {
            public const string CmdCloseDlgPending = "CmdCloseDlgPending";
        }

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

        public void MarkAsPending(int referenceNo, string newDueDate, string reason)
        {
            _presenter.MarkAsPending(referenceNo, newDueDate, reason);
        }

        public void MarkAsProcessing(int referenceNo)
        {
            _presenter.MarkAsProcessing(referenceNo);
        }

        public void MarkAsDone(int referenceNo)
        {
            _presenter.MarkAsDone(referenceNo);
        }

        protected void UpdateCountLabels()
        {
            lblProcessingCount.Text = ProcessingCount.ToString();
            lblPendingCount.Text = PendingCount.ToString();
            lblOnTimeCount.Text = OnTimeCount.ToString();
            lblLateCount.Text = LateCount.ToString();
            lblTotalCount.Text = TotalCount.ToString();
            upStatus.Update();
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
                _presenter.GetOrderInformation(int.Parse(sParameter));

                _presenter.SortOrderItemByAddress();

                lblActiveReferenceNo.Text = ActiveOrder.ReferenceNo.ToString();
                lblActiveOrderName.Text = ActiveOrder.Receiver.FirstName + " " +
                                          (!string.IsNullOrEmpty(ActiveOrder.Receiver.MiddleName)
                                              ? ActiveOrder.Receiver.MiddleName + " "
                                              : "") + ActiveOrder.Receiver.LastName;
                lblActiveOrderAddress.Text = ActiveOrder.Receiver.CurrentAddress;
                lblActiveOrderPhoneNumber.Text = ActiveOrder.Receiver.PhoneNumber;
                lblActiveOrderPlaceOfBirth.Text = ActiveOrder.Receiver.PlaceOfBirth;
                lblActiveOrderEmail.Text = ActiveOrder.Receiver.Email;
                lblActiveTransactionDate.Text = ActiveOrder.TransactionDate.ToString("d");

                repOrderMailingInfo.DataSource = ActiveOrderItemList;
                repOrderMailingInfo.DataBind();

                var status = _presenter.GetOrderStatus(ActiveOrder.ReferenceNo);

                var isDone = status == OrderStatusEnum.Late || status == OrderStatusEnum.OnTime;
                btnMarkProcessing.Visible = !isDone && status != OrderStatusEnum.Processing;
                btnMarkDone.Visible = !isDone && status != OrderStatusEnum.OnTime && status != OrderStatusEnum.Late;
                btnMarkPending.Visible = !isDone && status != OrderStatusEnum.Pending;

                upOrderInformation.Update();
            }
        }

        #endregion

        protected void btnMarkAsPending_OnClick(object sender, EventArgs e)
        {
            MarkAsPending(ActiveOrder.ReferenceNo, txtNewDueDate.Text, txtPendingReason.Text);
            GetOrderList();

            UpdateOrderInformationButton();
        }

        protected void btnMarkProcessing_OnClick(object sender, EventArgs e)
        {
            MarkAsProcessing(ActiveOrder.ReferenceNo);
            upDlgPending.Update();
            GetOrderList();

            UpdateOrderInformationButton();
        }

        protected void btnMarkDone_OnClick(object sender, EventArgs e)
        {
            MarkAsDone(ActiveOrder.ReferenceNo);
            GetOrderList();

            UpdateOrderInformationButton();
        }

        protected void UpdateOrderInformationButton()
        {
            GetOrderInformation(ActiveOrder.ReferenceNo);
            var status = ActiveOrder.OrderStatus;

            var isDone = status == OrderStatusEnum.Late || status == OrderStatusEnum.OnTime;
            btnMarkProcessing.Visible = !isDone && status != OrderStatusEnum.Processing;
            btnMarkDone.Visible = !isDone && status != OrderStatusEnum.OnTime && status != OrderStatusEnum.Late;
            btnMarkPending.Visible = !isDone && status != OrderStatusEnum.Pending;
        }
    }
}