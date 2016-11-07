using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlGetDegreeList:DBMySqlSelectConnection
    {
        public Degree[] degreeList;

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format("SELECT * FROM {0}", Degree.Table);
            Cmd.Prepare();
            throw new NotImplementedException();
        }

        public override void Parse()
        {
            degreeList = new Degree[ObjectList.Length];
            for (int i = 0; i < degreeList.Length; i++)
            {
                degreeList[i] = new Degree()
                {
                    CampusOffered = (CampusEnum) (int.Parse(ObjectList[i][Degree.ColCampusOfferedId].ToString())),
                    Code = ObjectList[i][Degree.ColDegreeAbbrv].ToString(),
                    Id = int.Parse(ObjectList[i][Degree.ColDegreeId].ToString()),
                    Level = (DegreeLevelEnum) (int.Parse(ObjectList[i][Degree.ColLevel].ToString())),
                    Name = ObjectList[i][Degree.ColDegreeName].ToString(),

                };
            }
            throw new NotImplementedException();
        }
    }
}