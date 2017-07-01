using System;

namespace SOFENGG_Order_Request_Document.Model
{
    public class User
    {
        public enum GenderEnum
        {
            M = 'M',
            F = 'F'
        }

        public const string Table = "user";
        public const string ColIdNumber = "idNumber";
        public const string ColFirstName = "firstname";
        public const string ColMiddleName = "middlename";
        public const string ColLastName = "lastname";
        public const string ColGender = "gender";
        public const string ColBirthDate = "birthdate";
        public const string ColCitizenship = "citizenship";
        public const string ColPlaceOfBirth = "placeOfBirth";
        public const string ColCurrentAddress = "currentAddress";
        public const string ColPhoneNo = "phoneNo";
        public const string ColAlternatePhoneNo = "alternativePhoneNo";
        public const string ColEmail = "email";
        public const string ColAlternateEmail = "alternateEmail";
        public const string ColPassword = "password";
        public const string ColVerified = "verified";

        public int Id { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public GenderEnum Gender { get; set; }
        public DateTime BirthDate { get; set; }
        public string Citizenship { get; set; }
        public string PlaceOfBirth { get; set; }
        public string CurrentAddress { get; set; }
        public string PhoneNo { get; set; }
        public string AlternatePhoneNo { get; set; }
        public string Email { get; set; }
        public string AlternateEmail { get; set; }
        public string Password { get; set; }

        // TODO:
        public int Verified { get; set; }
    }
}