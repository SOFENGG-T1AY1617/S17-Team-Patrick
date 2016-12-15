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
        private readonly bool isForGraduate;
        private readonly bool isForUndergraduate;
        protected string AdditionalCondition;
        protected DocumentCategoryEnum Category;
        protected DegreeLevelEnum Degree;

        public DBMySqlGetDocumentList(int[] degreeIdList)
        {
            isForGraduate = false;
            isForUndergraduate = false;

            for (var i = 0; i < degreeIdList.Length; i++)
            {
                if (isForGraduate || isForUndergraduate)
                    break;

                var db = new DBMySqlGetDegreeList();
                db.SetQueryGivenDegreeId(degreeIdList[i]);

                if (db.DegreeList == null || db.DegreeList.Length <= 0)
                    continue;

                var degree = db.DegreeList[0];

                if (!isForUndergraduate && degree.Level == DegreeLevelEnum.Bachelors)
                    isForUndergraduate = true;
                else if (!isForGraduate)
                    isForGraduate = true;
            }

            if (isForUndergraduate)
                AdditionalCondition = string.Format(" WHERE {0} = @{0}", Document.ColForUndergraduate);

            if (string.IsNullOrEmpty(AdditionalCondition) && isForGraduate)
                AdditionalCondition = string.Format(" WHERE {0} = @{0}", Document.ColForGraduate);
            else if (!string.IsNullOrEmpty(AdditionalCondition) && isForGraduate)
                AdditionalCondition += string.Format(" AND {0} = @{0}", Document.ColForGraduate);

        }

        public DBMySqlGetDocumentList(DocumentCategoryEnum category,DegreeLevelEnum degree )
        {
            if (degree == DegreeLevelEnum.Bachelors)
            {
                isForUndergraduate = true;
                AdditionalCondition = string.Format(" WHERE {0} = @{0} && {1} = {2}", Document.ColCategory, Document.ColForUndergraduate, isForUndergraduate ? 1 : 0);
                Category = category;
            }
            else
            {
                isForGraduate = true;
                AdditionalCondition = string.Format(" WHERE {0} = @{0} && {1} = {2}", Document.ColCategory, Document.ColForUndergraduate, isForGraduate ? 1 : 0);
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
            Cmd.CommandText = string.Format("SELECT * FROM {0} {1} ORDER BY {2}", Document.Table, AdditionalCondition, Document.ColCategory);

            try
            {
                Cmd.Parameters.AddWithValue("@" + Document.ColCategory, (int)Category);
                Cmd.Parameters.AddWithValue("@" + Document.ColForGraduate, isForGraduate ? 1 : 0);
                Cmd.Parameters.AddWithValue("@" + Document.ColForUndergraduate, isForUndergraduate ? 1 : 0);
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