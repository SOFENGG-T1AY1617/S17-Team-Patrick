using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public class OrderWithCourseDesc : Order
    {
        public new const string Table = "ordercoursedescs";
        public new const string ColId = "orderCourseDescID";
        public const string ColOrderId = "OrderID";
        public const string ColCourseId = "CourseID";

        public Course[] CourseList { get; set; }
    }
}