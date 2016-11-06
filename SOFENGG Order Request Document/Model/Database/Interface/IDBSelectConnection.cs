using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    interface IDBSelectConnection: IDBConnection
    {
        void Parse();
    }
}
