﻿using System;

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
        bool MarkAsDone(Order order);
        bool MarkAsPending(DateTime newDueDate, string reason);
        bool MarkAsProcessing(Order order);
    }
}
