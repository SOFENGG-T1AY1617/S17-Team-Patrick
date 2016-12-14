using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Presenter;
using SOFENGG_Order_Request_Document.Presenter.Order;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI.WebControls;

namespace SOFENGG_Order_Request_Document.View.Order
{
    public partial class OrderItem : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["StudentInfo"] == null)
            {
                HttpCookie Scookie = new HttpCookie("StudentInfo");
                Scookie["Id"] = "1";
                Scookie["MailingInfoNum"] = "0";
                Scookie["StudentDegreeNum"] = "1";
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

            if (!IsPostBack)
            {
                DisplayStudentDegree();
                DisplayAllMailingInfo();
                DisplayInfo();
            }

        }

        private void DisplayAllMailingInfo()
        {
            InfoMailDePresenter presenter = new InfoMailDePresenter(null);
            List<MailingInfo> mailingInfoList = new List<MailingInfo>();
            int mailingInfoNumber = int.Parse(Request.Cookies["StudentInfo"]["MailingInfoNum"]);
            for (var i = 0; i < mailingInfoNumber; i++)
            {
                HttpCookie cookie = null;
                if (Request.Cookies["MailInformation" + i] == null)
                    continue;
                cookie = Request.Cookies["MailInformation" + i];
                mailingInfoList.Add(new MailingInfo()
                {
                    ContactNo = cookie["ContactNo"],
                    DeliveryArea = presenter.GetOneDeliveryArea(int.Parse(cookie["DeliveryArea"])),
                    Id = i,
                    MailingAddress = cookie["MailingAddress"],
                    StudentInfoId = int.Parse(Request.Cookies["StudentInfo"]["Id"]),
                    ZipCode = int.Parse(cookie["Zipcode"]),
                });
            }
            ddlAddresses.Items.Clear();
            for (int i = 0; i < mailingInfoList.Count; i++)
            {
                ddlAddresses.Items.Insert(i, new ListItem(mailingInfoList[i].DeliveryArea.Name, mailingInfoList[i].DeliveryArea.Id + ""));
            }
        }

        private void DisplayStudentDegree()
        {
            InfoAcadDePresenter presenter = new InfoAcadDePresenter(null);
            List<StudentDegree> studentDegreeList = new List<StudentDegree>();
            int studentDegreeNumber = int.Parse(Request.Cookies["StudentInfo"]["StudentDegreeNum"]);
            for (int i = 0; i < studentDegreeNumber; i++)
            {
                HttpCookie cookie = null;
                if (Request.Cookies["AcadInformation" + i] == null)
                    continue;
                cookie = Request.Cookies["AcadInformation" + i];
                studentDegreeList.Add(new StudentDegree()
                {
                    AdmittedAs = (AdmissionEnum)int.Parse(cookie["AdmittedAs"]),
                    IdStudent = int.Parse(cookie["IdStudent"]),
                    Degree = presenter.GetOneDegree(int.Parse(cookie["Degree"])),
                    YearAdmitted = int.Parse(cookie["YearAdmitted"]),
                    Id = i,
                    StudentInfoId = int.Parse(Request.Cookies["StudentInfo"]["Id"])

                });
            }
            ddlAcademicProfile.Items.Clear();
            for (int i = 0; i < studentDegreeList.Count; i++)
            {
                ddlAcademicProfile.Items.Insert(i, new ListItem(studentDegreeList[i].Degree.Name, studentDegreeList[i].Degree.Id + ""));
            }
        }

        private void DisplayInfo()
        {
            OrderItemPresenter presenter = new OrderItemPresenter();
            Document[] ayy = new Document[] { presenter.getDocumentName(DocumentId) };
            Document document = presenter.getDocumentName(DocumentId);
            List<Document> documentList = new List<Document>();
            /*for (int i = 0; i < document.Length; i++)
            {
                documentList.Add(document[i]);
            }*/
            documentList.Add(document);


            lblRegularPrice.Text = document.RegularPrice.ToString();
            if (document.ExpressPrice != 0  || document.Id == 12)
            {
                lblExpressPrice.Text = "Php " + document.ExpressPrice.ToString();
                rbExpress.Visible = true;

            }
            if (document.Id == 12)
            {
                lblExpressPrice.Text = "Php " + document.ExpressPrice.ToString();
                rbExpress.Visible = true;
            }

            repDocumentname.DataSource = ayy;
            repDocumentname.DataBind();




        }


        /*private void DisplayInfo()
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
            
            documentList.Add(document);

            

            lblRegularPrice.Text = document.RegularPrice.ToString();
            if(document.ExpressPrice != 0 && document.Id ==4)
            {
                lblExpressPrice.Text = "Php " + document.ExpressPrice.ToString();
                rbExpress.Visible = true;
               
            }
            if(document.Id == 12)
            {
                lblExpressPrice.Text = "Php " + document.ExpressPrice.ToString();
                rbExpress.Visible = true;
            }
                


            repAcademicProfile.DataSource = studentdegree;
            repAcademicProfile.DataBind();

            repDocumentname.DataSource = ayy;
            repDocumentname.DataBind();

            ddlNoCopy.DataSource = Enumerable.Range(1,document.MaxCopy);
            ddlNoCopy.DataBind();

         //   ddlAddresses.DataSource = mailingInfo;
        //    ddlAddresses.DataBind();
        }
        */

        protected void SubmitOrderInfo(object sender, EventArgs e)
        {
            /*List<Model.OrderItem> orderList = null;
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
                MailingAddress = new MailingInfo { Id = },
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
            */
            // Add to cookies
            /*
            o.MailingAddress = addtoCart["mailingAddress"];
            o.NoOfCopies = int.Parse(addtoCart["noofpackaging"]);
            o.Packaging = addtoCart["packaging"];
            o.OrderType = addtoCart["Ordertype"]; */
            /*
            var orderItem = (OrderItem) new JavaScriptSerializer().DeserializeObject(json);

            Request.Cookies.Add(addtoCart);
            Response.Redirect("~/View/Order/InfoTransaction.aspx")
            */

            var orderItemCookie = Request.Cookies["orderItem"];

            if(orderItemCookie == null)
            {
                orderItemCookie = new HttpCookie("orderItem");
                orderItemCookie["docuId"] = Request.Cookies["Document"]["id"];
                if (rbExpress.Checked == true)
                {
                    orderItemCookie["orderType"] = 1+"";
                }
                else
                    orderItemCookie["orderType"] = 0+"";

                orderItemCookie["mailingId"] = ddlAddresses.Text;
                orderItemCookie["noOfCopies"] = ddlNoCopy.Text;
                orderItemCookie["packaging"] = optInsert.Text;

            }
            else
            {
                orderItemCookie["docuId"] += ","+ Request.Cookies["Document"]["id"];
                if (rbExpress.Checked == true)
                {
                    orderItemCookie["orderType"] += ",1";
                }
                else
                    orderItemCookie["orderType"] += ",0";

                orderItemCookie["mailingId"] += "," + ddlAddresses.Text;
                orderItemCookie["noOfCopies"] += "," + ddlNoCopy.Text;
                orderItemCookie["packaging"] += "," + optInsert.Text;

            }

            Response.Cookies.Add(orderItemCookie);
          //  Response.Redirect("~/View/Order/InfoTransaction.aspx");

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