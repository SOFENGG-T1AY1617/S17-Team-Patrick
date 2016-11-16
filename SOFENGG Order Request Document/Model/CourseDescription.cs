using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public class CourseDescription : OrderItem
    {
        public const string TableCourseDescription = "ordercoursedesc";
        public const string ColId = "orderCourseDescId";
        public const string ColCourseId = "courseId";

        public Course CourseList { get; set; }
    }
}