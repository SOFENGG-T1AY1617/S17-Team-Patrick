using System;

namespace SOFENGG_Order_Request_Document.View.Order.Interface
{
    public interface IPersonalInformationView
    {
        int StudentInfoId { get; set; }
        string LastName { get; set; }
        string FirstName { get; set; }
        string MiddleName { get; set; }
        int Gender { get; set; }
        DateTime BirthDate { get; set; }
        string Citizenship { get; set; }
        string CurrentAddress { get; set; }
        string PhoneNumber { get; set; }
        string EmailAddress { get; set; }
        string HighSchoolAttended { get; set; }
        string PlaceOfBirth { get; set; }

        void Submit();
    }
}
