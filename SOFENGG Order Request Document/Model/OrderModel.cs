using System;
using SOFENGG_Order_Request_Document.Model.Database;

namespace SOFENGG_Order_Request_Document.Model
{
    public class OrderModel: IOrderModel
    {
        
        public Document[] GetDocumentList()
        {
            var db = new DBMySqlGetDocumentList();
            db.ExecuteQuery();
            return db.DocumentList;
        } 

        public Document[] GetCertificateDocumentList(DocumentCategoryEnum Category, Degree degree )
        {
            var db = new DBMySqlGetDocumentList(Category, degree.Level);
            db.ExecuteQuery();
            return db.DocumentList;
        }

        public Document[] GetOthersDocumentList(DocumentCategoryEnum Category, Degree degree)
        {
            var db = new DBMySqlGetDocumentList(Category, degree.Level);
            db.ExecuteQuery();
            return db.DocumentList;
        }

        public Document[] GetTORDocumentList(DocumentCategoryEnum Category, Degree degree)
        {
            var db = new DBMySqlGetDocumentList(Category, degree.Level);
            db.ExecuteQuery();
            return db.DocumentList;
        }

        public Document[] GetTrueCopyDocumentList(DocumentCategoryEnum Category, Degree degree)
        {
            var db = new DBMySqlGetDocumentList(Category, degree.Level);
            db.ExecuteQuery();
            return db.DocumentList;
        }

    }
}