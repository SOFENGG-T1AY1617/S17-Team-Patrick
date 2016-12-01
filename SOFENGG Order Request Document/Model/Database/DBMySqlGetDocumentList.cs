using SOFENGG_Order_Request_Document.Model.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlGetDocumentList : DBMySqlSelectConnection
    {
        public Document[] DocumentList;
        private readonly int _isGraduate;
        private readonly int _isUndergraduate;
        private readonly int _Category;
        protected string AdditionalCondition;
        protected DocumentCategoryEnum Category;
        protected DegreeLevelEnum Degree;

        public DBMySqlGetDocumentList(DocumentCategoryEnum category,DegreeLevelEnum degree )
        {
            if (degree == DegreeLevelEnum.Bachelors)
            {
                _isUndergraduate = 1;
                AdditionalCondition = string.Format(" WHERE {0} = @{0} && {1} = {2}", Document.ColCategory, Document.ColForUndergraduate, _isUndergraduate);
                Category = category;
            }
            else
            {
                _isGraduate = 1;
                AdditionalCondition = string.Format(" WHERE {0} = @{0} && {1} = {2}", Document.ColCategory, Document.ColForUndergraduate, _isGraduate);
                Category = category;
            }

            /*
                _isGraduate = isGraduate;
            _isUndergraduate = isUndergraduate;
            string var = string.Format("WHERE {0} == @{1} && {2} == @{3}", 
                Document.ColForGraduate, _isGraduate, Document.ColForUndergraduate, _isUndergraduate);
                */
            

        }

        public DBMySqlGetDocumentList(DocumentCategoryEnum category)
        {
            AdditionalCondition = string.Format(" WHERE {0} = @{0}", Document.ColCategory);
            Category = category;
        }

        public DBMySqlGetDocumentList()
        {
        }

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format("SELECT * FROM {0}", Document.Table);


            try
            {
                if (string.IsNullOrEmpty(AdditionalCondition))
                    return;
                Cmd.CommandText += AdditionalCondition;
                Cmd.Parameters.AddWithValue("@" + Document.ColCategory, (int)Category);
            }
            //            Cmd.Parameters.AddWithValue("@name", "banana");
            finally
            {
                Cmd.Prepare();
                System.Diagnostics.Debug.WriteLine(Cmd.GetPreparedStatementString());
            }
            
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