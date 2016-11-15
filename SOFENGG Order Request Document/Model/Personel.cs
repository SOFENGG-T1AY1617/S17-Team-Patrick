using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
	public class Personel
    {
        public const string Table = "personel";
        public const string ColId = "personelId";
        public const string ColLastName = "lastName";
        public const string ColFirstName = "firstName";

        public string LastName { get; set; }
        public string FirstName { get; set; }
    }
}