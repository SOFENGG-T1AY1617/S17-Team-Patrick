using System.Data;

namespace SOFENGG_Order_Request_Document.Model.Database.OrderInformation
{
    public class DBMySqlGetDocument : DBMySqlSelectConnection
    {
        public Document Document { get; private set; }

        private readonly int _documentId;

        public DBMySqlGetDocument(int documentId)
        {
            _documentId = documentId;
        }

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format("SELECT * FROM {0} WHERE {1} = @{1}", Document.Table, Document.ColId);

            Cmd.Parameters.AddWithValue("@" + Document.ColId, _documentId);
            Cmd.Prepare();
        }

        public override void Parse()
        {
            if (ObjectList == null || ObjectList.Length == 0)
                throw new NoNullAllowedException(string.Format("No document found on documentId = '{0}'",
                    _documentId));

            var regularPrice = ObjectList[0][Document.ColRegularPrice].ToString();
            var expressPrice = ObjectList[0][Document.ColExpressPrice].ToString();

            Document = new Document
            {
                Id = _documentId,
                Name = ObjectList[0][Document.ColName].ToString(),
                Category = (DocumentCategoryEnum) int.Parse(ObjectList[0][Document.ColCategory].ToString()),
                Weight = float.Parse(ObjectList[0][Document.ColWeight].ToString()),
                RegularPrice = !string.IsNullOrEmpty(regularPrice) ? float.Parse(regularPrice) : 0,
                ExpressPrice = !string.IsNullOrEmpty(expressPrice) ? float.Parse(expressPrice) : 0,
                MaxCopy = int.Parse(ObjectList[0][Document.ColMaxCopy].ToString()),
                IsAvailable = int.Parse(ObjectList[0][Document.ColIsAvailable].ToString()) == 1,
                IsForUndergraduate = int.Parse(ObjectList[0][Document.ColForUndergraduate].ToString()) == 1,
                IsForGraduate = int.Parse(ObjectList[0][Document.ColForGraduate].ToString()) == 1
            };
        }
    }
}