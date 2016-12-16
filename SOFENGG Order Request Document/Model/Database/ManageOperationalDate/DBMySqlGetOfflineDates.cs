using System;

namespace SOFENGG_Order_Request_Document.Model.Database.ManageOperationalDate
{
    public class DBMySqlGetOfflineDates : DBMySqlSelectConnection
    {
        public Offline[] OfflineDateList;

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format("SELECT {4}, {2}, {5}, {6} FROM {0} INNER JOIN {1} ON {2} = {3} ORDER BY {4} DESC", Offline.Table, Personel.Table, Offline.ColAddedByPersonelId, Personel.ColId, Offline.ColDate, Personel.ColFirstName, Personel.ColLastName);

            //            Cmd.Parameters.AddWithValue("@name", "banana");
            Cmd.Prepare();
        }

        public override void Parse()
        {
            OfflineDateList = new Offline[ObjectList.Length];

            for (var i = 0; i < OfflineDateList.Length; i++)
            {
                var test = ObjectList[i][Offline.ColDate].ToString();
                OfflineDateList[i] = new Offline
                {
                    Date = DateTime.Parse(ObjectList[i][Offline.ColDate].ToString()),
                    Personel = new Personel
                    {
                        Id = int.Parse(ObjectList[i][Offline.ColAddedByPersonelId].ToString()),
                        FirstName = ObjectList[i][Personel.ColFirstName].ToString(),
                        LastName = ObjectList[i][Personel.ColLastName].ToString()
                    }
                };
            }
        }
    }
}