using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Presenter.Order;
using System;
using System.Collections.Generic;
using System.Web;

namespace SOFENGG_Order_Request_Document.View.Order
{
    public partial class OrderItem : System.Web.UI.Page
    {
        public int DocumentId { get; set; }
        public int StudentInfoId { get; set; }
        public string Degree { get; set; }
        public string Name { get; set; }
        public StudentDegree[] studentDegreeList { get; set; }

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

            Document document = presenter.getDocumentName(DocumentId);
            List<Document> documentList = new List<Document>();

            documentList.Add(document);
            


            repAcademicProfile.DataSource = studentdegree;
            repAcademicProfile.DataBind();

            /*repDocumentname.DataSource = document;
            repDocumentname.DataBind();*/

            


        }
    }
}