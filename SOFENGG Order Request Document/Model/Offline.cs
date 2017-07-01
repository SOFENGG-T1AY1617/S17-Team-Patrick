using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public class Offline
    {
        public const string Table = "offline";
        public const string ColDate = "date";
        public const string ColAddedByPersonelId = "addedByPersonelID";

        public DateTime Date { get; set; }
        public Personel AddedByPersonel { get; set; }
    }
}