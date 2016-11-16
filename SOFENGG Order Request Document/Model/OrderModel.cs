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

        public Document[] GetCertificateDocumentList(DocumentCategoryEnum Category)
        {
            var db = new DBMySqlGetDocumentList(Category);
            db.ExecuteQuery();
            return db.DocumentList;
        }

        public Document[] GetOthersDocumentList(DocumentCategoryEnum Category)
        {
            var db = new DBMySqlGetDocumentList(Category);
            db.ExecuteQuery();
            return db.DocumentList;
        }

        public Document[] GetTORDocumentList(DocumentCategoryEnum Category)
        {
            var db = new DBMySqlGetDocumentList(Category);
            db.ExecuteQuery();
            return db.DocumentList;
        }

        public Document[] GetTrueCopyDocumentList(DocumentCategoryEnum Category)
        {
            var db = new DBMySqlGetDocumentList(Category);
            db.ExecuteQuery();
            return db.DocumentList;
        }

    }
}