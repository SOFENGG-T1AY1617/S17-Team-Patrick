using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    interface IAdminModel
    {
        bool AddDocument(Document document);
        bool EditDocument(Document document);
        bool DeleteDocument(Document document);
        Document[] GetDocumentList();
        Document[] GetPendingDocumentList();
        bool MarkAsDone(Order order);
        bool MarkAsPending(DateTime newDueDate, string reason);
        bool MarkAsProcessing(Order order);
    }
}
