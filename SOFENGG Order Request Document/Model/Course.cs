using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public class Course
    {
        public const string Table = "courses";
        public const string ColId = "courseID";
        public const string ColName = "name";
        public const string ColAcronym = "acronym";

        public int Id { get; set; }
        public string Name { get; set; }
        public string Acronym { get; set; }
        
    }
}