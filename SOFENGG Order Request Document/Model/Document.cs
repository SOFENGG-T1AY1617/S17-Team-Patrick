using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public enum DocumentCategoryEnum
    {
        [Description("Transcript of Records")]
        TranscriptOfRecords = 1,
        [Description("Certification")]
        Certification = 2,
        [Description("Certified True Copy")]
        CertifiedTrueCopy = 3,
        [Description("Others")]
        Others = 4,
        

    }

    public class Document
    {
        public const string Table = "document";
        public const string ColId = "documentId";
        public const string ColName = "name";
        public const string ColCategory = "categoryId";
        public const string ColWeight = "weight";
        public const string ColRegularPrice = "regularPrice";
        public const string ColExpressPrice = "expressPrice";
        public const string ColMaxCopy = "maxCopy";
        public const string ColIsAvailable = "isAvailable";
        public const string ColForUndergraduate = "forUndergraduate";
        public const string ColForGraduate = "forGraduate";

        public int Id { get; set; }
        public string Name { get; set; }
        public DocumentCategoryEnum Category { get; set; }
        public float Weight { get; set; }
        public float RegularPrice { get; set; }
        public float ExpressPrice { get; set; }
        public int MaxCopy { get; set; }
        public bool IsAvailable { get; set; }
        public bool IsForUndergraduate { get; set; }
        public bool IsForGraduate { get; set; }
    }
}