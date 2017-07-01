using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public class TransactionLog
    {
        public const string Table = "transactionlogs";
        public const string ColId = "logID";
        public const string ColTransactionId = "transactionID";
        public const string ColDateLogged = "dateLogged";
        public const string ColPersonelId = "personelID";
        public const string ColRemarks = "remarks";

        public int Id { get; set; }
        public DateTime DateLogged { get; set; }
        public Personel Personel { get; set; }
        public string Remarks { get; set; }
    }
}