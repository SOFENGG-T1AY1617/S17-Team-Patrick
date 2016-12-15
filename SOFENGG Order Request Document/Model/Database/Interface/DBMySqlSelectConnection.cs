using System;
using System.Data;
using System.Diagnostics;
using System.Linq;
using MySql.Data.MySqlClient;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public abstract class DBMySqlSelectConnection : DBMySqlConnection, IDBSelectConnection
    {
        protected MySqlCommand Cmd;
        protected DataRow[] ObjectList { get; private set; }

        public override bool ExecuteQuery()
        {
            try
            {
                using (Cmd =
                    new MySqlCommand())
                {
                    Cmd.Connection = Conn;
                    SetQuery();

                    using (var dt = new DataTable())
                    {
                        dt.Load(Cmd.ExecuteReader());
                        ObjectList = dt.AsEnumerable().ToArray();
                    }

                    Parse();

                    return ObjectList != null;
                }
            }
            finally
            {
                Close();
            }
        }

        public abstract void Parse();

        protected abstract void SetQuery();
    }
}