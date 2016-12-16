using System;

namespace SOFENGG_Order_Request_Document.Model
{
    interface IAdminModel
    {
        bool AddDocument(Document document);
        bool EditDocument(Document document);
        bool DeleteDocument(Document document);
        Document[] GetDocumentList();
        Order[] GetOrderList();
        Order[] GetOrderList(OrderStatusEnum orderStatus);
        bool MarkAsDone(int referenceNo);
        bool MarkAsPending(int referenceNo, DateTime newDueDate, string reason);
        bool MarkAsProcessing(int referenceNo);
        Order GetOrderInformation(int referenceNo);
        Document GetDocument(int documentId);
        Personel Login(string email, string password);
        Offline[] GetOfflineDateList();
        bool AddOfflineDate(Offline offline);
        bool DeleteOfflineDate(DateTime date);
    }
}