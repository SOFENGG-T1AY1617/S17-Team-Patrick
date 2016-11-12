using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Helper;
using SOFENGG_Order_Request_Document.Presenter.Admin;
using SOFENGG_Order_Request_Document.View.Admin.Interface;

namespace SOFENGG_Order_Request_Document.View.Admin
{
    public partial class DocumentList : Page, IDocumentListView
    {

        private readonly DocumentListPresenter _presenter;
        private GridViewRow _gvRow;

        public Document[] AvailableDocumentList
        {
            set
            {
                gvDocuments.DataSource = value;
                gvDocuments.DataBind();
            }
        }

        #region Initialization Functions

        public DocumentList()
        {
            _presenter = new DocumentListPresenter(this);
        }

        protected void listDoc_OnItemCreated(object sender, RepeaterItemEventArgs e)
        {
            var sm = ScriptManager.GetCurrent(this);
            if (sm == null)
                return;

            sm.RegisterAsyncPostBackControl(btnAdd);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            GetDocumentList();
        }

        #endregion

        public void GetDocumentList()
        {
            _presenter.GetDocumentList();
            FormatPrices();
        }

        private void FormatPrices()
        {
            foreach (GridViewRow oItem in gvDocuments.Rows)
            {
                for (var i = 3; i <= 4; i++)
                    if (oItem.Cells[i].Text == "0")
                        oItem.Cells[i].Text = "Not available";
            }
        }

        #region Add Functions

        public void AddDocument()
        {
            // Parse Name
            var name = txtName.Text.Trim();

            if (string.IsNullOrEmpty(name))
                throw new NullReferenceException("Name cannot be empty. Please enter a name for the new document.");

            // Parse Regular Price
            var regularPriceValue = txtRegularPrice.Text;
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
            var expressPriceValue = txtExpressPrice.Text;
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
            var weightValue = txtWeight.Text;
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


            var document = new Document()
            {
                Name = name,
                RegularPrice = regularPrice,
                ExpressPrice = expressPrice,
                Weight = weight
            };

            if (!_presenter.AddDocument(document))
            {
                // TODO: Error handling
                throw new Exception("Failed to add");
            }

            GetDocumentList();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            AddDocument();
        }

        #endregion

        #region Delete Functions

        protected void gvDocuments_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            _gvRow = gvDocuments.Rows[e.RowIndex];
            DeleteDocument();
            CommitDocumentListEdit();
        }

        public void DeleteDocument()
        {
            if (!_presenter.DeleteDocument(GetDocumentFromCurrentRow(true)))
            {
                // TODO: Error handler
                throw new Exception("Failed to delete");
            }
        }

        #endregion

        #region Editing Functions

        public void EditDocument()
        {
            if (!_presenter.EditDocument(GetDocumentFromCurrentRow()))
            {
                // TODO: Error handler
                throw new Exception("Failed to update");
            }
        }

        protected void gvDocuments_OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDocuments.EditIndex = e.NewEditIndex;
            GetDocumentList();
        }

        protected void gvDocuments_OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            _gvRow = gvDocuments.Rows[e.RowIndex];
            EditDocument();
            CommitDocumentListEdit();
        }

        protected void gvDocuments_OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            CommitDocumentListEdit();
        }

        #endregion

        private void CommitDocumentListEdit()
        {
            gvDocuments.EditIndex = -1;
            GetDocumentList();
        }


        private Document GetDocumentFromCurrentRow(bool isIdOnly = false)
        {
            // Parse Id
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
            var name = ((TextBox) _gvRow.Cells[1].FindControl("txtEditName")).Text.Trim();
            if (string.IsNullOrEmpty(name))
                throw new NullReferenceException("Name cannot be empty. Please enter a name for the document.");

            // Parse the Category Value
            var categoryValue = ((Label) _gvRow.Cells[2].FindControl("lblCategory")).Text.Trim();
            var category = categoryValue.GetValueFromDescription<DocumentCategoryEnum>();

            // Parse Regular Price
            var regularPriceValue = ((TextBox) _gvRow.Cells[3].FindControl("txtEditRegularPrice")).Text;
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
            var expressPriceValue = ((TextBox) _gvRow.Cells[4].FindControl("txtEditExpressPrice")).Text;
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
            var weightValue = ((TextBox) _gvRow.Cells[5].FindControl("txtEditWeight")).Text;
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

            // Parse Max Copy
            var maxCopyValue = ((TextBox) _gvRow.Cells[6].FindControl("txtEditMaxCopy")).Text;
            int maxCopy;

            try
            {
                maxCopy = maxCopyValue.TryParseInt();
            }
            catch (NullReferenceException e)
            {
                throw new NullReferenceException(
                    "Max Copy cannot be empty. Please enter a max copy count for the document.", e);
            }
            catch (FormatException e)
            {
                throw new FormatException("Invalid Max Copy", e);
            }

            // Get IsForUndergraduate
            var isForUndergraduate = ((CheckBox) _gvRow.Cells[7].FindControl("chEditForUndergraduate")).Checked;
            var isForGraduate = ((CheckBox)_gvRow.Cells[8].FindControl("chEditForGraduate")).Checked;

            return new Document
            {
                Id = id,
                Name = name,
                Category = category,
                RegularPrice = regularPrice,
                ExpressPrice = expressPrice,
                Weight = weight,
                MaxCopy = maxCopy,
                IsForUndergraduate = isForUndergraduate,
                IsForGraduate = isForGraduate
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