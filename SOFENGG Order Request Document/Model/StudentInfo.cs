using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public enum GenderEnum
    {
        Female = 0,
        Male   = 1
    }
	public class StudentInfo
	{
        public int Id { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public GenderEnum Gender { get; set; }
        public string CurrentAddress { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string Citizenship { get; set; }
        public DateTime BirthDate { get; set; }
        public string HighSchoolAttended { get; set; }
        public string PlaceOfBirth { get; set; }
        public StudentDegree[] StudentDegreeList { get; set; }
        public MailingInfo[] MailingInfoList { get; set; }
	}
}