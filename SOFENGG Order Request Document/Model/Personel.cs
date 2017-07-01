using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public class Personel
    {
        public const string Table = "personel";
        public const string ColId = "personelID";
        public const string ColLastName = "lastName";
        public const string ColFirstName = "firstName";
        public const string ColEmail = "email";
        public const string ColPassword = "password";

        public int Id { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string Email { get; set; }
    }
}