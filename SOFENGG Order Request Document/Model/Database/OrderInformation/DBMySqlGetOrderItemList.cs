using System;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using MySql.Data.MySqlClient;
using SOFENGG_Order_Request_Document.Model.Helper;

namespace SOFENGG_Order_Request_Document.Model.Database.OrderInformation
{
    public class DBMySqlGetOrderItemList: DBMySqlSelectConnection
    {
        public OrderItem[] OrderItemList;

        private readonly int _referenceNo;
        private readonly MailingInfo _mailingInfo;
        private readonly OrderType _orderType;

        public DBMySqlGetOrderItemList(int referenceNo, MailingInfo mailingInfo, OrderType orderType)
        {
            _referenceNo = referenceNo;
            _mailingInfo = mailingInfo;
            _orderType = orderType;
        }

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format(
                @"SELECT *
                FROM {0}
                WHERE {1} = @{1} AND {2} = @{2} AND {3} = @{3}
                ", OrderItem.Table,
                 OrderItem.ColReferenceNo, OrderItem.ColMailingId, OrderItem.ColOrderType);

            Cmd.Parameters.AddWithValue("@" + OrderItem.ColReferenceNo, _referenceNo);
            Cmd.Parameters.AddWithValue("@" + OrderItem.ColMailingId, _mailingInfo.Id);
            Cmd.Parameters.AddWithValue("@" + OrderItem.ColOrderType, (int) _orderType);
            Cmd.Prepare();
            Debug.WriteLine(Cmd.GetPreparedStatementString());
        }

        public override void Parse()
        {
            OrderItemList = new OrderItem[ObjectList.Length];
            for (var i = 0; i < OrderItemList.Length; i++)
            {
                var studentDegreeId = ObjectList[i][OrderItemWithDegree.ColStudentDegreeId].ToString();
                var specificationTerm = ObjectList[i][OrderItemWithTerm.ColSpecificationTerm].ToString();
                var specificationYear = ObjectList[i][OrderItemWithTerm.ColSpecificationYear].ToString();

                var o = OrderItemList;

                if (!string.IsNullOrEmpty(studentDegreeId))
                {
                    o[i] = new OrderItemWithDegree();
                    ((OrderItemWithDegree) o[i]).StudentDegree = GetStudentDegree(int.Parse(studentDegreeId));
                }

                if (!string.IsNullOrEmpty(specificationTerm) && !string.IsNullOrEmpty(specificationYear))
                {
                    o[i] = new OrderItemWithTerm();
                    ((OrderItemWithTerm)o[i]).SpecificationTerm = int.Parse(ObjectList[i][OrderItemWithTerm.ColSpecificationTerm].ToString());
                    ((OrderItemWithTerm)o[i]).SpecificationYear = int.Parse(specificationYear);
                }

                o[i].Document = GetDocument(int.Parse(ObjectList[i][OrderItem.ColDocumentId].ToString()));
                o[i].MailingAddress = _mailingInfo;
                o[i].NoOfCopies = int.Parse(ObjectList[i][OrderItem.ColNoOfCopies].ToString());
                o[i].OrderType = _orderType;
                o[i].Packaging = (PackagingEnum)int.Parse(ObjectList[i][OrderItem.ColPackaging].ToString());
            }
        }

        protected StudentDegree GetStudentDegree(int studentDegreeId)
        {
            var db = new DBMySqlGetStudentDegree(studentDegreeId);
            if (!db.ExecuteQuery())
                throw new NoNullAllowedException(string.Format("No studentDegree found on studentDegreeId = '{0}'",
                    studentDegreeId));

            return db.StudentDegree;
        }

        protected Document GetDocument(int documentId)
        {
            var db = new DBMySqlGetDocument(documentId);
            if (!db.ExecuteQuery())
                throw new NoNullAllowedException(string.Format("No document found on documentId = '{0}'",
                    documentId));

            return db.Document;
        }
    }
}