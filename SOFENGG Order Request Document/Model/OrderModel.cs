using System;
using SOFENGG_Order_Request_Document.Model.Database;

namespace SOFENGG_Order_Request_Document.Model
{
    public class OrderModel: IOrderModel
    {
        
        /*public Document[] GetDocumentList()
        {
            var db = new DBMySqlGetDocumentList();
            db.ExecuteQuery();
            return db.DocumentList;
        } */

        public Document[] GetCertificateDocumentList(int Category)
        {
            var db = new DBMySqlGetDocumentList(Category);
            db.ExecuteQuery();
            return db.DocumentList;
        }

    }
}