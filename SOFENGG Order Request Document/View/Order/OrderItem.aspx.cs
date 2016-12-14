using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Presenter.Order;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace SOFENGG_Order_Request_Document.View.Order
{
    public partial class OrderItem : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["StudentInfo"] == null)
            {
                HttpCookie Scookie = new HttpCookie("StudentInfo");
                Scookie["Id"] = "2";
                Response.Cookies.Add(Scookie);
            }

            if (Request.Cookies["Document"] == null)
            {
                HttpCookie Dcookie = new HttpCookie("Document");
                Dcookie["id"] = 1 + "";
                Response.Cookies.Add(Dcookie);
            }
            StudentInfoId = int.Parse(Request.Cookies["StudentInfo"]["Id"]);
            DocumentId = int.Parse(Request.Cookies["Document"]["id"]);

            DisplayInfo();
            
        }

        private void DisplayInfo()
        {
            OrderItemPresenter presenter = new OrderItemPresenter();
            StudentDegree[] studentdegree = presenter.getAcademicProfile(StudentInfoId);
            List<StudentDegree> studentDegreeList = new List<StudentDegree>();
            for (int i = 0; i < studentdegree.Length; i++)
            {
                studentDegreeList.Add(studentdegree[i]);
            }
            Document[] ayy = new Document[] { presenter.getDocumentName(DocumentId) };
            Document document = presenter.getDocumentName(DocumentId);
            List<Document> documentList = new List<Document>();
           
            /*
            MailingInfo[] mailingInfo = presenter.getMailingInfo(StudentInfoId);
            List<MailingInfo> mailingInfoList = new List<MailingInfo>();
            for (int i = 0; i < mailingInfo.Length; i++)
            {
                mailingInfoList.Add(mailingInfo[i]);
            }
            */
            documentList.Add(document);

            lblRegularPrice.Text = document.RegularPrice.ToString();
            lblExpressPrice.Text = document.ExpressPrice.ToString();


            repAcademicProfile.DataSource = studentdegree;
            repAcademicProfile.DataBind();

            repDocumentname.DataSource = ayy;
            repDocumentname.DataBind();

            ddlNoCopy.DataSource = Enumerable.Range(1,document.MaxCopy);
            ddlNoCopy.DataBind();

         //   ddlAddresses.DataSource = mailingInfo;
        //    ddlAddresses.DataBind();
        }

        protected void SubmitOrderInfo(object sender, EventArgs e)
        {
            List<Model.OrderItem> orderList = null;
            var orderListCookie = Request.Cookies["orderList"];

            if (orderListCookie == null)
            {
                orderList = new List<Model.OrderItem>();
            }
            else
            {
                orderList = (List < Model.OrderItem > ) new JavaScriptSerializer().DeserializeObject(orderListCookie.Value);
            }

            var o = new Model.OrderItem
            {
                Document = new Document { Id = int.Parse(Request.Cookies["Document"]["id"]) },
                MailingAddress = new MailingInfo { },
                NoOfCopies = new int { },
                Packaging = new PackagingEnum { },
                OrderType = new OrderType { }
            };


            orderList.Add(o);

            orderListCookie.Value = new JavaScriptSerializer().Serialize(orderList);

            HttpCookie addtoCart = new HttpCookie("addtoCart");

            if (rbRegular.Checked == true)
            {
                Price = lblRegularPrice.Text.TryParseInt();
                addtoCart["Ordertype"] = OrderType.Regular.ToString();
            }
            else
            {
                Price = lblExpressPrice.Text.TryParseInt();
                addtoCart["Ordertype"] = OrderType.Express.ToString();
            }
                

            addtoCart["Price"] = Price.ToString();
            if (cbPickup.Checked == true)
            {
                Campus = (CampusEnum)int.Parse(ddlCampus.SelectedValue);
                addtoCart["Campus"] = Campus.ToString();
                
            }
            else
            {
                mailingaddress = ddlAddresses.Text;
                addtoCart["mailingAddress"] = mailingaddress;
            }
            NoOfCopies = int.Parse(ddlNoCopy.Text);

            addtoCart["noofpackaging"] = NoOfCopies.ToString();

            packaging = (PackagingEnum)int.Parse(optInsert.Text);

            addtoCart["packaging"] = packaging.ToString();

      

           

            var json = new JavaScriptSerializer().Serialize(o);

            // Add to cookies
            o.MailingAddress = addtoCart["mailingAddress"];
            o.NoOfCopies = int.Parse(addtoCart["noofpackaging"]);
            o.Packaging = addtoCart["packaging"];
            o.OrderType = addtoCart["Ordertype"];

            var orderItem = (OrderItem) new JavaScriptSerializer().DeserializeObject(json);

            Request.Cookies.Add(addtoCart);
            // Response.Redirect("~/View/Order/InfoTransaction.aspx")


        }

        public PackagingEnum packaging { get; set; } 
        public string mailingaddress { get; set; }
        public int NoOfCopies { get; set; }
        public CampusEnum Campus { get; set; }
        public int DocumentId { get; set; }
        public int StudentInfoId { get; set; }
        public string Degree { get; set; }
        public string Name { get; set; }
        public float Price { get; set; }
        public StudentDegree[] studentDegreeList { get; set; }
    }
}