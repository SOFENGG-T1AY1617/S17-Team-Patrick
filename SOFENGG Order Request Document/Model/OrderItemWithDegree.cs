using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public class OrderItemWithDegree : OrderItem
    {
        public const string ColStudentDegreeId = "studentDegreeId";

        public StudentDegree StudentDegree { get; set; }
    }
}