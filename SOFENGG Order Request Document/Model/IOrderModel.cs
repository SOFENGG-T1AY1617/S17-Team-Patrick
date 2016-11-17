using System;

namespace SOFENGG_Order_Request_Document.Model
{
    interface IOrderModel
    {

        Document[] GetDocumentList();
        Document[] GetTORDocumentList(DocumentCategoryEnum Category);
        Document[] GetCertificateDocumentList(DocumentCategoryEnum Category);
        Document[] GetTrueCopyDocumentList(DocumentCategoryEnum Category);
        Document[] GetOthersDocumentList(DocumentCategoryEnum Category);

    }
}
