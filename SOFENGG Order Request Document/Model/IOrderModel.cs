using System;

namespace SOFENGG_Order_Request_Document.Model
{
    interface IOrderModel
    {

        Document[] GetDocumentList();
        Document[] GetDocumentList(int[] degreeIdList);
        Document[] GetTORDocumentList(DocumentCategoryEnum Category,Degree degree);
        Document[] GetCertificateDocumentList(DocumentCategoryEnum Category, Degree degree);
        Document[] GetTrueCopyDocumentList(DocumentCategoryEnum Category, Degree degree);
        Document[] GetOthersDocumentList(DocumentCategoryEnum Category,Degree degree);
        

    }
}
