using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlGetDocumentList : DBMySqlSelectConnection
    {
        public Document[] DocumentList;
        /* private readonly bool _isGraduate;
         private readonly bool _isUndergraduate;

         public DBMySqlGetDocumentList(bool isGraduate, bool isUndergraduate)
         {
             _isGraduate = isGraduate;
             _isUndergraduate = isUndergraduate;
         } */

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format("SELECT * FROM {0}", Document.Table);

//            Cmd.Parameters.AddWithValue("@name", "banana");
            Cmd.Prepare();
        }

        public override void Parse()
        {
            DocumentList = new Document[ObjectList.Length];

            for (var i = 0; i < DocumentList.Length; i++)
            {
                var regularPrice = ObjectList[i][Document.ColRegularPrice].ToString();
                var expressPrice = ObjectList[i][Document.ColExpressPrice].ToString();

                DocumentList[i] = new Document
                {
                    Id = int.Parse(ObjectList[i][Document.ColId].ToString()),
                    Name = ObjectList[i][Document.ColName].ToString(),
                    Category = (DocumentCategoryEnum)int.Parse(ObjectList[i][Document.ColCategory].ToString()),
                    Weight = float.Parse(ObjectList[i][Document.ColWeight].ToString()),
                    RegularPrice = !string.IsNullOrEmpty(regularPrice) ? float.Parse(regularPrice) : 0,
                    ExpressPrice = !string.IsNullOrEmpty(expressPrice) ? float.Parse(expressPrice) : 0,
                    MaxCopy = int.Parse(ObjectList[i][Document.ColMaxCopy].ToString()),
                    IsAvailable = int.Parse(ObjectList[i][Document.ColIsAvailable].ToString()) == 1,
                    IsForUndergraduate = int.Parse(ObjectList[i][Document.ColForUndergraduate].ToString()) == 1,
                    IsForGraduate = int.Parse(ObjectList[i][Document.ColForGraduate].ToString()) == 1
                };
            }
        }
    }
}