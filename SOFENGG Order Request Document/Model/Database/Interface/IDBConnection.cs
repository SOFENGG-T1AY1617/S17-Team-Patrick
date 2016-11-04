using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public interface IDBConnection
    {
        void Connect();
        bool ExecuteQuery();
        void Close();
    }
}