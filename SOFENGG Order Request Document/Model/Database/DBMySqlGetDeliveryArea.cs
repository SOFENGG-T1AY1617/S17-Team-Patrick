﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlGetDeliveryArea:DBMySqlSelectConnection
    {
        public DeliveryArea[] deliveryAreaList;

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format("SELECT * FROM {0}", DeliveryArea.Table);
            Cmd.Prepare();
            throw new NotImplementedException();
        }

        public override void Parse()
        {
            deliveryAreaList = new DeliveryArea[ObjectList.Length];
            for (int i = 0; i < deliveryAreaList.Length; i++)
            {
                deliveryAreaList[i] = new DeliveryArea()
                {
                    DaysToDeliver = ObjectList[i][DeliveryArea.ColDaysToDeliver].ToString(),
                    Id = int.Parse(ObjectList[i][DeliveryArea.ColDeliveryAreaId].ToString()),
                    Name = ObjectList[i][DeliveryArea.ColAreaName].ToString(),
                    Price = ObjectList[i][DeliveryArea.ColPrice].ToString(),
                };
            }
            throw new NotImplementedException();
        }


    }
}