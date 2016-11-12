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
            Cmd.CommandText = string.Format("SELECT * FROM {0} WHERE idStudent = '" + studentInfo.StudentInfoId, MailingInfo.Table);
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
                    DeliveryArea = getDeliveryArea(int.Parse(ObjectList[i][MailingInfo.ColDeliveryAreaId].ToString())),
                    ContactNo = ObjectList[i][MailingInfo.ColContactNo].ToString(),


                };
            }
            throw new NotImplementedException();
        }

        public DeliveryArea getDeliveryArea(int mailingInfoDeliveryId)
        {
            var deliveryAreaDB = new DBMySqlGetDeliveryArea();
            deliveryAreaDB.ExecuteQuery();

            for (int i = 0; i < deliveryAreaDB.deliveryAreaList.Length; i++)
            {
                if (deliveryAreaDB.deliveryAreaList[i].Id == mailingInfoDeliveryId)
                {
                    return deliveryAreaDB.deliveryAreaList[i];
                }
            }
            return null;
        }
    }
}