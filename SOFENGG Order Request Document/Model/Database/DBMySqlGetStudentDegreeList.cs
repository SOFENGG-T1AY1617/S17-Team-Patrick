using System;
using MySql.Data.MySqlClient;
using SOFENGG_Order_Request_Document.Model.Database.Interface;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlGetStudentDegreeList: DBMySqlSelectConnection
    {
        public int StudentInfoId;
        public StudentDegree[] StudentDegreeList;

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format("SELECT * FROM {0} WHERE {1} = " + StudentInfoId, StudentDegree.Table, StudentDegree.ColStudentInfoId);
            
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
                    Id = int.Parse(ObjectList[i][StudentDegree.ColStudentDegreeId].ToString()),
                    Degree = model.GetDegree(int.Parse(ObjectList[i][StudentDegree.ColDegreeId].ToString())),
                    YearAdmitted = int.Parse(ObjectList[i][StudentDegree.ColYearAdmitted].ToString()),
                    AdmittedAs = (AdmissionEnum) (ObjectList[i][StudentDegree.ColAdmittedAs]),

                };
            }
        }
        

    }
}