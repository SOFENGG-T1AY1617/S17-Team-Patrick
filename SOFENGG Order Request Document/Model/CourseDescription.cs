using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public enum PackagingEnum
    {
        None = 0,
        BrownEnvelope = 1,
        WhiteEnvelope = 2
    }
    public class CourseDescription
    {

        public const string Table = "coursedesc";
        public const string ColDtsNo = "DtsNo";
        public const string ColDocument = "document";
        public const string ColMailingAddress = "mailingAddress";
        public const string ColNoOfCopies = "noOfCopies";
        public const string ColPackaging = "packagingId";
        public const string ColCourseList = "courseList";

        public int DtsNo { get; set; }
        public Document Document { get; set; }
        public MailingAddress MailingAddress { get; set; }
        public int NoOfCopies { get; set; }
        public PackagingEnum Packaging { get; set; }
        public Course[] CourseList { get; set; }
    }
}