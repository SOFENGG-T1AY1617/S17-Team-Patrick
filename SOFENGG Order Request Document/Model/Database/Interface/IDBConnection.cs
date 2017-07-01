namespace SOFENGG_Order_Request_Document.Model.Database.Interface
{
    public interface IDBConnection
    {
        void Connect();
        bool ExecuteQuery();
        void Close();
    }
}