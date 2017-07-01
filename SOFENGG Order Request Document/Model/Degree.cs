namespace SOFENGG_Order_Request_Document.Model
{
    public class Degree
    {
        public const string Table = "degrees";
        public const string ColId = "id";
        public const string ColName = "name";
        public const string ColAcronym = "acronym";

        public int Id { get; set; }
        public string Name { get; set; }
        public string Acronym { get; set; }
    }
}