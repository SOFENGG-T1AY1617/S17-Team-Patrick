using System;
using SOFENGG_Order_Request_Document.Model.Database;
using SOFENGG_Order_Request_Document.Model.Database.ManageOperationalDate;
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

        public bool MarkAsDone(int referenceNo)
        {
            var db = new DBMySqlMarkAsDone(referenceNo);
            return db.ExecuteQuery();
        }

        public bool MarkAsPending(int referenceNo, DateTime newDueDate, string reason)
        {
            var db = new DBMySqlMarkAsPending(referenceNo, newDueDate, reason);
            return db.ExecuteQuery();
        }

        public bool MarkAsProcessing(int referenceNo)
        {
            var db = new DBMySqlMarkAsProcessing(referenceNo);
            return db.ExecuteQuery();
        }

        public Order GetOrderInformation(int referenceNo)
        {
            var db = new DBMySqlGetOrderInformation(referenceNo);
            db.ExecuteQuery();
            return db.OrderInformation;
        }

        public Document GetDocument(int documentId)
        {
            var db = new DBMySqlGetDocument(documentId);
            db.ExecuteQuery();
            return db.Document;
        }

        public Personel Login(string email, string password)
        {
            var db = new DBMySqlGetPersonelDetails(email, password);
            db.ExecuteQuery();
            return db.Personel;
        }

        public Offline[] GetOfflineDateList()
        {
            var db = new DBMySqlGetOfflineDates();
            db.ExecuteQuery();
            return db.OfflineDateList;
        }

        public bool AddOfflineDate(Offline offline)
        {
            var db = new DBMySqlAddOfflineDate(offline);
            return db.ExecuteQuery();
        }

        public bool DeleteOfflineDate(DateTime date)
        {
            var db = new DBMySqlDeleteOfflineDate(date);
            return db.ExecuteQuery();
        }
    }
}