using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public enum GenderEnum
    {
        Female = 'f',
        Male = 'm'    
    }

    public class StudentInfo
    {
        public const string Table = "studentinfo";
        public const string ColId = "idnumber";
        public const string ColLastName = "lastName";
        public const string ColFirstName = "firstName";
        public const string ColMiddleName = "middleName";
        public const string ColGender = "gender";
        public const string ColEmail = "email";
        public const string ColBirthDate = "birthDate";
        public const string ColCitizenship = "citizenship";
        public const string ColAddress = "address";
        public const string ColPhoneNumber = "phoneNumber";
        public const string ColHighSchoolAttended = "highSchoolAttended";
        public const string ColPlaceOfBirth = "placeOfBirth";


        public int IdNumber { get; set; }
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