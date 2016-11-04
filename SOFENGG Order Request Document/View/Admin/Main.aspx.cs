using System;
using System.Web.UI;
using MySql.Data.MySqlClient;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Database;

namespace SOFENGG_Order_Request_Document.View.Admin
{
    public partial class Main : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
//            var d = new Document()
//            {
//                Category = DocumentCategoryEnum.Others,
//                ExpressPrice = 87000.0f,
//                RegularPrice = 1234.0f,
//                IsAvailable = true,
//                IsForUndergraduate = true,
//                IsForGraduate = false,
//                MaxCopy = 0,
//                Name = "sample poh",
//                Weight = 123.123f
//            };
//
//            var db = new DBMySqlAddDocument(d);
//            db.ExecuteQuery();
//            db.Close();

            var d2 = new DBMySqlGetDocumentList();
            d2.ExecuteQuery();
            var d1 = false;
        }
    }
}