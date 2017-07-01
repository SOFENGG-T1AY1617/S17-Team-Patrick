namespace SOFENGG_Order_Request_Document.Model
{
    public class Campus
    {
        public const string Table = "campus";
        public const string ColId = "id";
        public const string ColCampusName = "campusName";

        public int Id { get; set; }
        public string CampusName { get; set; }
    }
}