using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Helper;
using SOFENGG_Order_Request_Document.Presenter.Order;
using SOFENGG_Order_Request_Document.View.Order.Interface;

namespace SOFENGG_Order_Request_Document.View.Order
{
    public partial class DocumentList : System.Web.UI.Page, IOrderDocumentListView
    {
        private readonly OrderDocumentListPresenter _presenter;
        private GridViewRow _gvRow;


        public DocumentList()
        {
            _presenter = new OrderDocumentListPresenter(this);
        }

        public Document[] AvailableDocumentList
        {
            set
            {
                gvDocumentList.DataSource = value;
                gvDocumentList.DataBind();
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            GetDocumentList();
        }

        public void GetDocumentList()
        {
            _presenter.GetDocumentList();
           
        }

      

        private Document GetDocumentFromCurrentRow(bool isIdOnly = false)
        {
            // Parse the Category Value
            var categoryValue = ((DataBoundLiteralControl)_gvRow.Cells[2].Controls[0]).Text.Trim();
            var category = categoryValue.GetValueFromDescription<DocumentCategoryEnum>();

            // Parse Weight
            var idValue = _gvRow.Cells[0].Text;
            int id;

            try
            {
                id = idValue.TryParseInt();
            }
            catch (NullReferenceException e)
            {
                throw new NullReferenceException("ID cannot be null.", e);
            }
            catch (FormatException e)
            {
                throw new FormatException("Invalid ID", e);
            }

            if (isIdOnly)
                return new Document
                {
                    Id = id
                };

            // Format name
            var name = ((TextBox)_gvRow.Cells[1].Controls[0]).Text.Trim();
            if (string.IsNullOrEmpty(name))
                throw new NullReferenceException("Name cannot be empty. Please enter a name for the document.");

            // Parse Regular Price
            var regularPriceValue = ((TextBox)_gvRow.Cells[3].Controls[0]).Text;
            float regularPrice;

            try
            {
                regularPrice = regularPriceValue.TryParsePrice();
            }
            catch (FormatException e)
            {
                throw new FormatException("Invalid Regular Price", e);
            }

            // Parse Express Price
            var expressPriceValue = ((TextBox)_gvRow.Cells[4].Controls[0]).Text;
            float expressPrice;

            try
            {
                expressPrice = expressPriceValue.TryParsePrice();
            }
            catch (FormatException e)
            {
                throw new FormatException("Invalid Express Price", e);
            }

            // Parse Weight
            var weightValue = ((TextBox)_gvRow.Cells[5].Controls[0]).Text;
            float weight;

            try
            {
                weight = weightValue.TryParseFloat();
            }
            catch (NullReferenceException e)
            {
                throw new NullReferenceException("Weight cannot be empty. Please enter a weight for the document.", e);
            }
            catch (FormatException e)
            {
                throw new FormatException("Invalid Weight", e);
            }

            return new Document
            {
                Id = id,
                Name = name,
                Category = category,
                RegularPrice = regularPrice,
                ExpressPrice = expressPrice,
                Weight = weight
                //
            };
        }
    }

    internal static class FormatParser
    {
        public static float TryParsePrice(this string priceValue)
        {
            float price;
            priceValue = priceValue.Trim();

            if (string.IsNullOrEmpty(priceValue))
                price = 0f;
            else if (!float.TryParse(priceValue, out price))
                throw new FormatException();

            return price;
        }

        public static float TryParseFloat(this string str, bool isRequired = true)
        {
            float value;
            str = str.Trim();

            if (string.IsNullOrEmpty(str) && isRequired)
                throw new NullReferenceException();
            if (!float.TryParse(str, out value))
                throw new FormatException();

            return value;
        }

        public static int TryParseInt(this string str, bool isRequired = true)
        {
            int value;
            str = str.Trim();

            if (string.IsNullOrEmpty(str) && isRequired)
                throw new NullReferenceException();
            if (!int.TryParse(str, out value))
                throw new FormatException();

            return value;
        }
    }



}