using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace SOFENGG_Order_Request_Document.Model.Helper
{
    public static class MySqlQueryHelper
    {
        public static string GetPreparedStatementString(this MySqlCommand cmd)
        {
            var query = cmd.CommandText;

            for (var i = 0; i < cmd.Parameters.Count; i++)
            {
                var p = cmd.Parameters[i];
                query = query.Replace(p.ParameterName, p.Value.ToString());
            }

            return query;
        }
    }
}