using System.Data;

namespace SOFENGG_Order_Request_Document.Model.Database.OrderInformation
{
    public class DBMySqlGetStudentInfoId : DBMySqlSelectConnection
    {
        public int StudentInfoId { get; private set; }

        private readonly int _mailingId;

        public DBMySqlGetStudentInfoId(int mailingId)
        {
            _mailingId = mailingId;
        }

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format(
                @"SELECT {0}
                FROM {1}
                WHERE {2} = @{2}
                ", MailingInfo.ColMailingId,
                MailingInfo.Table,
                MailingInfo.ColMailingId);

            Cmd.Parameters.AddWithValue("@" + MailingInfo.ColMailingId, _mailingId);
            Cmd.Prepare();
        }

        public override void Parse()
        {
            if (ObjectList == null || ObjectList.Length == 0)
                throw new NoNullAllowedException(string.Format("No studentInfoId found on mailingId = '{0}'",
                    _mailingId));

            StudentInfoId = int.Parse(ObjectList[0][MailingInfo.ColMailingId].ToString());
        }
    }
}