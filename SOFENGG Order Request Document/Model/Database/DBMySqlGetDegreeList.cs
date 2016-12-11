using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlGetDegreeList:DBMySqlSelectConnection
    {
        public Degree[] DegreeList;
        private MySqlCommand tempCmd;

        public void SetQueryForAllDegree()
        {
            tempCmd = new MySqlCommand();
            tempCmd.CommandText = string.Format("SELECT * FROM {0};", Degree.Table);
        }

        public void SetQueryGivenDegreeId(int degreeId)
        {
            tempCmd = new MySqlCommand();
            Degree degree = new Degree()
            {Id = degreeId,};
            tempCmd.CommandText = string.Format("SELECT * FROM {0} WHERE {1} = {2}", Degree.Table, Degree.ColDegreeId, degree.Id);
        }

        public void SetQueryGivenInput(CampusEnum campus, string name, DegreeLevelEnum level)
        {
            tempCmd = new MySqlCommand();
            Degree degree = new Degree()
            {
                CampusOffered = campus, Name = name, Level = level,
            };
            

            tempCmd.CommandText = string.Format("SELECT * FROM {0} WHERE {1} = {4} and {2} = '{5}' and {3} = '{6}';",
                Degree.Table, Degree.ColCampusOfferedId, Degree.ColDegreeName, Degree.ColLevel,
                (int)degree.CampusOffered, degree.Name, (char)degree.Level);
        }

        public void SetQueryGivenCampus(CampusEnum campus)
        {
            tempCmd = new MySqlCommand();
            tempCmd.CommandText = string.Format("SELECT * FROM {0} WHERE campusOfferedId = {1}", Degree.Table, Degree.ColCampusOfferedId);
        }

        protected override void SetQuery()
        {
            string commandText = tempCmd.CommandText;
            Cmd.CommandText = commandText;
            
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
    }
}