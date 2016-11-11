using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public enum AdmissionEnum
    {
        Regular = 0,
        Transferee = 1,
        Graduate = 2
    }
	public class StudentDegree
	{
        public int IdNumber { get; set; }
        public int Year { get; set; }
        public AdmissionEnum AdmittedAs { get; set; }
        public Degree Degree { get; set; }
	}
}