using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlGetDegreeList:DBMySqlSelectConnection
    {
        public Degree Degree;
        public Degree[] DegreeList;
        public string Query;

        public void SetCustomQuery(String query)
        {
            Query = query;

        }

        protected override void SetQuery()
        {
            Cmd.CommandText = Query;
            /*
            Cmd.CommandText = string.Format("SELECT * FROM {0} WHERE {1} = '"+ Degree.Name + "' and " +
                                            "{2} = "+ (int)Degree.CampusOffered + " and " +
                                            "{3} = '" + (char)Degree.Level  + "';",
                                            Degree.Table,
                                            Degree.ColDegreeName, Degree.ColCampusOfferedId, Degree.ColLevel);*/
            
            Cmd.Prepare();
        }

        public override void Parse()
        {
            DegreeList = new Degree[ObjectList.Length];
            for (int i = 0; i < DegreeList.Length; i++)
            {

                DegreeList[i] = new Degree()
                {
                    CampusOffered = (CampusEnum)(int.Parse(ObjectList[i][Degree.ColCampusOfferedId].ToString())),
                    Code = ObjectList[i][Degree.ColDegreeAbbrv].ToString(),
                    Id = int.Parse(ObjectList[i][Degree.ColDegreeId].ToString()),
                    Level = (DegreeLevelEnum) (ObjectList[i][Degree.ColLevel].ToString()[0]),
                    Name = ObjectList[i][Degree.ColDegreeName].ToString(),

                };
            }
        }

        public void setDegree(Degree degree)
        {
            Degree = degree;
        }
    }
}