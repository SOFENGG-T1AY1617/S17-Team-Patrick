using System;
using MySql.Data.MySqlClient;
using SOFENGG_Order_Request_Document.Model.Database.Interface;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlGetStudentDegreeList: DBMySqlSelectConnection
    {
        public StudentDegree[] StudentDegreeList;

        private MySqlCommand tempCmd;

        public void SetQueryGivenStudentInfoId(int studentInfoId)
        {
            tempCmd = new MySqlCommand();
            tempCmd.CommandText = string.Format("SELECT * FROM {0} WHERE {1} = " + studentInfoId, StudentDegree.Table, StudentDegree.ColStudentInfoId);

        }

        public void SetQueryGivenStudentDegreeId(int degreeId)
        {
            tempCmd = new MySqlCommand();
            tempCmd.CommandText = string.Format("SELECT * FROM {0} WHERE {1} = " + degreeId, StudentDegree.Table, StudentDegree.ColDegreeId);

        }

        public void SetQueryForAllStudentDegree()
        {
            tempCmd = new MySqlCommand();
            tempCmd.CommandText = string.Format("SELECT * FROM {0};", StudentDegree.Table);
        }

        protected override void SetQuery()
        {
            Cmd.CommandText = tempCmd.CommandText;
            Cmd.Prepare();
        }

        public override void Parse()
        {
            var model = new UserModel();
            StudentDegreeList = new StudentDegree[ObjectList.Length];

            for (int i = 0; i < StudentDegreeList.Length; i++)
            {
                StudentDegreeList[i] = new StudentDegree()
                {
                    IdStudent = int.Parse(ObjectList[i][StudentDegree.ColIdStudent].ToString()),
                    Id = int.Parse(ObjectList[i][StudentDegree.ColStudentDegreeId].ToString()),
                    Degree = model.GetDegree(int.Parse(ObjectList[i][StudentDegree.ColDegreeId].ToString())),
                    YearAdmitted = int.Parse(ObjectList[i][StudentDegree.ColYearAdmitted].ToString()),
                    AdmittedAs = (AdmissionEnum) int.Parse(ObjectList[i][StudentDegree.ColAdmittedAs].ToString()),

                };
            }
        }
        

    }
}