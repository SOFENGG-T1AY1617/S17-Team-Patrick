namespace SOFENGG_Order_Request_Document.Model
{
    public class DeliveryRate
    {
        public const string Table = "deliveryrates";
        public const string ColId = "locationID";
        public const string ColPrice = "price";
        public const string ColMinDelay = "minDelay";
        public const string ColMaxDelay = "maxDelay";
        public const string ColLocation = "location";

        public int Id { get; set; }
        public float Price { get; set; }
        public int MinDelay { get; set; }
        public int MaxDelay { get; set; }
        public string Location { get; set; }
    }
}