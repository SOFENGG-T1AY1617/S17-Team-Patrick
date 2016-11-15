using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlGetIsGraduateDocument : DBMySqlSelectConnection
    {

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format("SELECT * FROM {0}", Document.Table);

            //            Cmd.Parameters.AddWithValue("@name", "banana");
            Cmd.Prepare();
        }

        public override void Parse()
        {
            throw new NotImplementedException();
        }

        
    }
}