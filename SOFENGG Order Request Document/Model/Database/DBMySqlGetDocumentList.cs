using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlGetDocumentList : DBMySqlSelectConnection
    {
        public Document[] DocumentList;
        private readonly bool _isGraduate;
        private readonly bool _isUndergraduate;
        private readonly int _Category;

        
        public DBMySqlGetDocumentList()
        {

        }


        public DBMySqlGetDocumentList(bool isGraduate, bool isUndergraduate)
         {
             _isGraduate = isGraduate;
             _isUndergraduate = isUndergraduate;
         } 

        public DBMySqlGetDocumentList(int Category)
        {
            _Category = Category;
        }

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
                DocumentList[i] = new Document()
                {
                    Id = int.Parse(ObjectList[i][Document.ColId].ToString()),
                    Name = ObjectList[i][Document.ColName].ToString(),
                    Category = (DocumentCategoryEnum)int.Parse(ObjectList[i][Document.ColCategory].ToString()),
                    Weight = float.Parse(ObjectList[i][Document.ColWeight].ToString()),
                    RegularPrice = float.Parse(ObjectList[i][Document.ColRegularPrice].ToString()),
                    ExpressPrice = float.Parse(ObjectList[i][Document.ColExpressPrice].ToString()),
                    MaxCopy = int.Parse(ObjectList[i][Document.ColMaxCopy].ToString()),
                    IsAvailable = bool.Parse(ObjectList[i][Document.ColIsAvailable].ToString()),
                    IsForUndergraduate = bool.Parse(ObjectList[i][Document.ColForUndergraduate].ToString()),
                    IsForGraduate = bool.Parse(ObjectList[i][Document.ColForGraduate].ToString())
                };
            }
        }
    }
}