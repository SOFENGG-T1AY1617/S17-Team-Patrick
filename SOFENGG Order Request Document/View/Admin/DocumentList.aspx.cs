using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Helper;
using SOFENGG_Order_Request_Document.Presenter.Admin;
using SOFENGG_Order_Request_Document.View.Admin.Interface;
using System;
using System.Diagnostics;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SOFENGG_Order_Request_Document.View.Admin
{
    public partial class DocumentList : Page, IDocumentListView
    {
        private readonly DocumentListPresenter _presenter;

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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                ProcessAjaxPostBack();
                return;
            }

            GetDocumentList();
        }

        private void ProcessAjaxPostBack()
        {
            var sControlName = Request.Params.Get("__EVENTTARGET");
            var sParameter = Request.Params.Get("__EVENTARGUMENT");

            if (string.IsNullOrEmpty(sControlName) || string.IsNullOrEmpty(sParameter))
                return;

            if (sControlName == upDocumentList.ClientID)
            {
                var document = _presenter.GetDocument(int.Parse(sParameter));
                txtEditName.Text = document.Name;
                txtEditRegularPrice.Text = document.RegularPrice.ToString(CultureInfo.InvariantCulture);
                txtEditExpressPrice.Text = document.ExpressPrice.ToString(CultureInfo.InvariantCulture);
                txtEditWeight.Text = document.Weight.ToString(CultureInfo.InvariantCulture);
                txtEditMaxCopies.Text = document.MaxCopy.ToString();
                cbEditForUndergraduate.Checked = document.IsForUndergraduate;
                cbEditForGraduate.Checked = document.IsForGraduate;

                lblEditDocumentType.Text = ((int) document.Category).ToString();

                cmdUpEditDocument.Text = DateTime.Now.ToLongTimeString();
                upEditDocument.Update();
            }
            else if (sControlName == upDlgEditDocumentButtons.ClientID)
            {
                EditDocument(int.Parse(sParameter));
                GetDocumentList();
                cmdUpDocumentList.Text = DateTime.Now.ToLongTimeString();
                upDocumentList.Update();
            }
            else if (sControlName == upDlgDeleteDocumentButtons.ClientID)
            {
                DeleteDocument(int.Parse(sParameter));
                GetDocumentList();
                cmdUpDocumentList.Text = DateTime.Now.ToLongTimeString();
                upDocumentList.Update();
            }
        }

        #endregion Initialization Functions

        public void GetDocumentList()
        {
            _presenter.GetDocumentList();
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

            // Parse MaxCopy
            var maxCopyValue = txtMaxCopies.Text;
            int maxCopy;

            try
            {
                maxCopy = maxCopyValue.TryParseInt();
            }
            catch (NullReferenceException e)
            {
                throw new NullReferenceException("Max copy count cannot be empty. Please enter a max copy count for the document.", e);
            }
            catch (FormatException e)
            {
                throw new FormatException("Invalid max copy count", e);
            }

            var document = new Document()
            {
                Name = name,
                RegularPrice = regularPrice,
                ExpressPrice = expressPrice,
                Weight = weight,
                MaxCopy = maxCopy,
                IsForUndergraduate = cbForUndergraduate.Checked,
                IsForGraduate = cbForGraduate.Checked
            };

            if (!_presenter.AddDocument(document))
            {
                // TODO: Error handling
                throw new Exception("Failed to add");
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            AddDocument();
            GetDocumentList();
            cmdUpDocumentList.Text = DateTime.Now.ToLongTimeString();
            upDocumentList.Update();
        }

        #endregion Add Functions

        #region Delete Functions

        public void DeleteDocument(int documentId)
        {
            _presenter.DeleteDocument(new Document {Id = documentId});

//            if (!_presenter.DeleteDocument(new Document { Id = documentId }))
//            {
//                // TODO: Error handler
//                throw new Exception("Failed to delete");
//            }
//            else
//                Debug.WriteLine("success poh");
        }

        #endregion Delete Functions

        #region Editing Functions

        public void EditDocument(int documentId)
        {
            // Parse Name
            var name = txtEditName.Text.Trim();

            if (string.IsNullOrEmpty(name))
                throw new NullReferenceException("Name cannot be empty. Please enter a name for the new document.");

            // Parse Regular Price
            var regularPriceValue = txtEditRegularPrice.Text;
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
            var expressPriceValue = txtEditExpressPrice.Text;
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
            var weightValue = txtEditWeight.Text;
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

            // Parse MaxCopy
            var maxCopyValue = txtEditMaxCopies.Text;
            int maxCopy;

            try
            {
                maxCopy = maxCopyValue.TryParseInt();
            }
            catch (NullReferenceException e)
            {
                throw new NullReferenceException("Max copy count cannot be empty. Please enter a max copy count for the document.", e);
            }
            catch (FormatException e)
            {
                throw new FormatException("Invalid max copy count", e);
            }

            var document = new Document()
            {
                Id = documentId,
                Name = name,
                RegularPrice = regularPrice,
                ExpressPrice = expressPrice,
                Weight = weight,
                MaxCopy = maxCopy,
                IsForUndergraduate = cbEditForUndergraduate.Checked,
                IsForGraduate = cbEditForGraduate.Checked,
                Category = (DocumentCategoryEnum) int.Parse(lblEditDocumentType.Text)
            };

            _presenter.EditDocument(document);

//            if (!_presenter.EditDocument(document))
//            {
//                // TODO: Error handler
//                throw new Exception("Failed to update");
//            }
        }

        #endregion Editing Functions
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