using SOFENGG_Order_Request_Document.Model.Database.Interface;

namespace SOFENGG_Order_Request_Document.Model.Database.Document
{
    public class DBMySqlGetDocumentList : DBMySqlSelectConnection
    {
        public Model.Document[] DocumentList;

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format("SELECT * FROM {0}", Model.Document.Table);

//            Cmd.Parameters.AddWithValue("@name", "banana");
            Cmd.Prepare();
        }

        public override void Parse()
        {
            DocumentList = new Model.Document[ObjectList.Length];

            for (var i = 0; i < DocumentList.Length; i++)
            {
                var regularPrice = ObjectList[i][Model.Document.ColRegularPrice].ToString();
                var expressPrice = ObjectList[i][Model.Document.ColExpressPrice].ToString();

                DocumentList[i] = new Model.Document
                {
                    Id = int.Parse(ObjectList[i][Model.Document.ColId].ToString()),
                    DocumentName = ObjectList[i][Model.Document.ColDocuName].ToString(),
                    RegularPrice = !string.IsNullOrEmpty(regularPrice) ? float.Parse(regularPrice) : 0,
                    ExpressPrice = !string.IsNullOrEmpty(expressPrice) ? float.Parse(expressPrice) : 0,
                    Category = ObjectList[i][Model.Document.ColCategory].ToString(),
                    //                    Weight = float.Parse(ObjectList[i][Document.ColWeight].ToString()),
//                    MaxCopy = int.Parse(ObjectList[i][Document.ColMaxCopy].ToString()),
//                    IsAvailable = int.Parse(ObjectList[i][Document.ColIsAvailable].ToString()) == 1,
//                    IsForUndergraduate = int.Parse(ObjectList[i][Document.ColForUndergraduate].ToString()) == 1,
//                    IsForGraduate = int.Parse(ObjectList[i][Document.ColForGraduate].ToString()) == 1
                };
            }
        }
    }
}