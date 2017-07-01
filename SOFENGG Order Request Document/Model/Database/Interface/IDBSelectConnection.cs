namespace SOFENGG_Order_Request_Document.Model.Database.Interface
{
    interface IDBSelectConnection: Model.Database.IDBConnection
    {
        void Parse();
    }
}
