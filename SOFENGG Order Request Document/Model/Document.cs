namespace SOFENGG_Order_Request_Document.Model
{
    public class Document
    {
        public enum DocumentCategoryEnum
        {
            Others = 0,
            TranscriptOfRecords = 1,
            Certification = 2,
            CertifiedTrueCopy = 3
        }

        public const string Table = "documents";
        public const string ColId = "id";
        public const string ColDocuName = "docuName";
        public const string ColRegularPrice = "regularPrice";
        public const string ColExpressPrice = "expressPrice";
        public const string ColCategory = "category";
        public const string ColNote = "note";
        public const string ColWeight = "weight";
        public const string ColMaxCopy = "maxCopy";
        public const string ColIsAvailable = "isAvailable";
        public const string ColForUndergraduate = "forUndergraduate";
        public const string ColForGraduate = "forGraduate";

        public int Id { get; set; }
        public string DocumentName { get; set; }
        public float RegularPrice { get; set; }
        public float ExpressPrice { get; set; }
        public DocumentCategoryEnum Category { get; set; }
        public string Note { get; set; }
        public float Weight { get; set; }
        public int MaxCopy { get; set; }
        public bool IsAvailable { get; set; }
        public bool IsForUndergraduate { get; set; }
        public bool IsForGraduate { get; set; }

    }
}