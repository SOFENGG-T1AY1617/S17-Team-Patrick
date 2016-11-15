using System;

namespace SOFENGG_Order_Request_Document.Model
{
    interface IOrderModel
    {

        //Document[] GetDocumentList(int isGraduate, int isUndergraduate);
        Document[] GetCertificateDocumentList();
        
    }
}
