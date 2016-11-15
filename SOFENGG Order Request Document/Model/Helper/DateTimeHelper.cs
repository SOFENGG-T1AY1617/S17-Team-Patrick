using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model.Helper
{
    public static class DateTimeHelper
    {
        public static DateTime Max(this DateTime a, DateTime b)
        {
            return a > b ? a : b;
        }
    }
}