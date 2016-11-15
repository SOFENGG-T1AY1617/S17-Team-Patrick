using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public class Course
    {
        public const string Table = "course";
        public const string ColId = "courseId";
        public const string ColCode = "courseAbbrv";
        public const string ColName = "courseName";

        public string Code { get; set; }
        public string Name { get; set; }
    }
}