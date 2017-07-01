namespace SOFENGG_Order_Request_Document.Model
{
    public class MailingAddress
    {
        public const string Table = "mailingaddress";
        public const string ColId = "id";
        public const string ColZipCode = "zipcode";
        public const string ColStreetName = "streetName";
        public const string ColCity = "city";
        public const string ColCountry = "country";
        public const string ColLocationId = "locationID";
        public const string ColUserId = "userID";
        public const string ColAddressLine = "addressline";
        public const string ColContactPerson = "contactperson";
        public const string ColContactNumber = "contactnumber";

        public int Id { get; set; }
        public string ZipCode { get; set; }
        public string StreetName { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public DeliveryRate DeliveryRate { get; set; }
        public User User { get; set; }
        public string AddressLine { get; set; }
        public string ContactPerson { get; set; }
        public string ContactNumber { get; set; }
    }
}