using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model.Database.Interface
{
    public class DBMySqlGetMailingInfo: DBMySqlSelectConnection
    {
        public StudentInfo studentInfo = new StudentInfo(); //<-- Still looking for a way to have student as a global variable
        public MailingInfo[] mailingInfoList;

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format("SELECT * FROM {0} WHERE idStudent = '" + studentInfo.IdNumber, MailingInfo.Table);

            //            Cmd.Parameters.AddWithValue("@name", "banana");
            Cmd.Prepare();
            throw new NotImplementedException();
        }

        public override void Parse()
        {
            mailingInfoList = new MailingInfo[ObjectList.Length];
            for (int i = 0; i < mailingInfoList.Length; i++)
            {
                mailingInfoList[i] = new MailingInfo()
                {
                    Id = int.Parse(ObjectList[i][MailingInfo.ColMailingId].ToString()),
                    MailingAddress = int.Parse(ObjectList[i][MailingInfo.ColMailingAddress].ToString()),
                    ZipCode = int.Parse(ObjectList[i][MailingInfo.ColZipCode].ToString()),
                    DeliveryArea = new DeliveryArea(), //<--- will fix that later - Dyan
                    ContactNo = ObjectList[i][MailingInfo.ColContactNo].ToString(),


                };
            }



            throw new NotImplementedException();
        }

        
    }
}