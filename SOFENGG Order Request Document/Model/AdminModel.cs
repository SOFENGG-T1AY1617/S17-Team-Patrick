using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class AdminModel: IAdminModel
    {
        public bool AddDocument(Document document)
        {
            throw new NotImplementedException();
        }

        public bool EditDocument(Document document)
        {
            throw new NotImplementedException();
        }

        public bool DeleteDocument(Document document)
        {
            throw new NotImplementedException();
        }

        public Document[] GetDocumentList()
        {
            throw new NotImplementedException();
        }

        public Document[] GetPendingDocumentList()
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
    }
}