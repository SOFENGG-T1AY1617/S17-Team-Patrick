using System;
using SOFENGG_Order_Request_Document.Model.Database;
using SOFENGG_Order_Request_Document.Model.Database.OrderInformation;
using SOFENGG_Order_Request_Document.Model.Database.OrderList;

namespace SOFENGG_Order_Request_Document.Model
{
    public class AdminModel: IAdminModel
    {
        public bool AddDocument(Document document)
        {
            var db = new DBMySqlAddDocument(document);
            return db.ExecuteQuery();
        }

        public bool EditDocument(Document document)
        {
            var db = new DBMySqlEditDocument(document);
            return db.ExecuteQuery();
        }

        public bool DeleteDocument(Document document)
        {
            var db = new DBMySqlDeleteDocument(document);
            return db.ExecuteQuery();
        }

        public Document[] GetDocumentList()
        {
            var db = new DBMySqlGetDocumentList();
            db.ExecuteQuery();
            return db.DocumentList;
        }

        public Order[] GetOrderList()
        {
            var db = new DBMySqlGetOrderListPreview();
            db.ExecuteQuery();
            return db.OrderList;
        }

        public Order[] GetOrderList(OrderStatusEnum orderStatus)
        {
            throw new NotImplementedException();
        }

        public bool MarkAsDone(Order order)
        {
            throw new NotImplementedException();
        }

        public bool MarkAsPending(DateTime newDueDate, string reason)
        {
            throw new NotImplementedException();
        }

        public bool MarkAsProcessing(Order order)
        {
            throw new NotImplementedException();
        }

        public Order GetOrderInformation(int referenceNo)
        {
            var db = new DBMySqlGetOrderInformation(referenceNo);
            db.ExecuteQuery();
            return db.OrderInformation;
        }
    }
}