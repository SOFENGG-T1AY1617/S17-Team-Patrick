using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Helper;
using SOFENGG_Order_Request_Document.Presenter.Order;
using SOFENGG_Order_Request_Document.View.Order.Interface;
using System.Web;
using System.Diagnostics;

namespace SOFENGG_Order_Request_Document.View.Order
{
    public partial class DocumentList : System.Web.UI.Page, IOrderDocumentListView
    {
        private readonly OrderDocumentListPresenter _presenter;
        private GridViewRow _gvRow;

        public int id { get; set; }



        public DocumentList()
        {
            _presenter = new OrderDocumentListPresenter(this);
        }

        protected void OnSelectedIndexChangedCert(object sender, EventArgs e)
        {
            string documentname = (gvTOR.SelectedRow.FindControl("lbName") as Label).Text;
            HttpCookie docuCookie = new HttpCookie("Document");
            if(documentname.Equals("Course Subject Desciption"))
            {
                docuCookie["id"] = 3 + "";
            }
            else if(documentname.Equals("Ranking by Degree Program"))
            {
                docuCookie["id"] = 4 + "";
            }
            else if (documentname.Equals("Ranking by College"))
            {
                docuCookie["id"] = 7 + "";
            }
            else if (documentname.Equals("Trimestral Calendar"))
            {
                docuCookie["id"] = 8 + "";
            }
            else if (documentname.Equals("Completion of Academic Units"))
            {
                docuCookie["id"] = 9 + "";
            }
            else if (documentname.Equals("Cumulative GPA"))
            {
                docuCookie["id"] = 10 + "";
            }
            else if (documentname.Equals("Deans List"))
            {
                docuCookie["id"] = 11 + "";
            }

            Response.Cookies.Add(docuCookie);
            Response.Redirect("~/View/Order/OrderItem.aspx");
            // docuCookie[""];


        }

        protected void OnSelectedIndexChangedTOR(object sender, EventArgs e)
        {
            string documentname = (gvTOR.SelectedRow.FindControl("lbName") as Label).Text;
            Debug.Write("document namee: " + documentname);
            HttpCookie docuCookie = new HttpCookie("Document");
            if (documentname.Equals("TOR for Evalutaion"))
                docuCookie["id"] = 1 + "";
            else
                docuCookie["id"] = 2 + "";
            Response.Cookies.Add(docuCookie);
            // docuCookie[""];
            Debug.Write(docuCookie + "my cookie");

            Response.Redirect("~/View/Order/OrderItem.aspx");


        }

        protected void OnSelectedIndexChangedOthers(object sender, EventArgs e)
        {
            string documentname = (gvTOR.SelectedRow.FindControl("lbName") as Label).Text;
            HttpCookie docuCookie = new HttpCookie("Document");
            docuCookie["id"] = 12 + "";

            Response.Cookies.Add(docuCookie);
            Response.Redirect("~/View/Order/OrderItem.aspx");

            // docuCookie[""];


        }

        protected void OnSelectedIndexChangedTrueCopy(object sender, EventArgs e)
        {
            string documentname = gvTrueCopy.SelectedRow.Cells[0].Text;
            HttpCookie docuCookie = new HttpCookie("Document");
            // docuCookie[""];
            if (documentname.Equals("Transcript of Records"))
            {
                docuCookie["id"] = 5 + "";
            }
            else if (documentname.Equals("Form 137"))
            {
                docuCookie["id"] = 6 + "";
            }

            Response.Cookies.Add(docuCookie);
            Response.Redirect("~/View/Order/OrderItem.aspx");
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            HttpCookie cookie = new HttpCookie("StudentInfo");
            cookie["Id"] = 2 + "";
            Response.Cookies.Add(cookie);
            Debug.Write("\n\n\n ADDED PO!! \n\n\n");

            id = int.Parse(Request.Cookies["StudentInfo"]["id"]);

            GetDocumentList(id);
        }

        /*public Document[] AvailableDocumentList
         {

             set
             {
                 gvDocumentList.DataSource = value;
                 gvDocumentList.DataBind();


             }
         } */

        public Document[] CertificateDocumentList
        {
            set
            {
                gvCertification.DataSource = value;
                gvCertification.DataBind();
            }
        }

        public Document[] TORDocumentList
        {
            set
            {
                gvTOR.DataSource = value;
                gvTOR.DataBind();
            }
        }

        public Document[] TrueCopyDocumentList
        {
            set
            {
                gvTrueCopy.DataSource = value;
                gvTrueCopy.DataBind();
            }
        }

        public Document[] OthersDocumentList
        {
            set
            {
                gvOthers.DataSource = value;
                gvOthers.DataBind();
            }
        }

        






        

        public void GetDocumentList(int id)
        {
            
            _presenter.GetTORDocumentList(DocumentCategoryEnum.TranscriptOfRecords, id);
            _presenter.GetCertificateDocumentList(DocumentCategoryEnum.Certification, id);
            
            _presenter.GetTrueCopyDocumentList(DocumentCategoryEnum.CertifiedTrueCopy, id);
            _presenter.GetOthersDocumentList(DocumentCategoryEnum.Others, id);
           


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

        

      /*  protected void OrderDocument_Click(Object sender, EventArgs e)
        {
            OrderDocumentListPresenter _presenter = new OrderDocumentListPresenter(this);
        } */
    }



}