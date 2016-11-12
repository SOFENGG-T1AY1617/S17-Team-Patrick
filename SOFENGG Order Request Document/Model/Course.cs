using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{

	public class Course
	{
        public const string table = "course";
        public const string ColCode = "Code";
        public const string ColName = "Name";

        public int Code { get; set; }
        public string Name { get; set; }

	}
}