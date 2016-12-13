using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public class Campus
    {
        public const string table = "campus";
        public const string colId = "campusid";
        public const string colName = "campusname";

        public int campusId { get; set; }
        public string campusName { get; set; }
    }
}