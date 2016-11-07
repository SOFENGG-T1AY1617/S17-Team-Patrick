using System;
using MySql.Data.MySqlClient;
using SOFENGG_Order_Request_Document.Model.Database.Interface;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlGetStudentDegreeList: DBMySqlSelectConnection
    {
        public StudentInfo studentInfo; //<--- still looking for a way to store studentInfo globally between asp web pages. Thnx -Dyan
        public StudentDegree[] studentDegreeList;

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format("SELECT * FROM {0} WHERE idnumber = '" + studentInfo.IdNumber, StudentDegree.Table);

            //Cmd.Parameters.AddWithValue("@name", "banana");
            Cmd.Prepare();
            throw new NotImplementedException();
        }

        public override void Parse()
        {
            studentDegreeList = new StudentDegree[ObjectList.Length];

            for (int i = 0; i < studentDegreeList.Length; i++)
            {
                studentDegreeList[i] = new StudentDegree()
                {
                    Id = int.Parse(ObjectList[i][StudentDegree.ColDegreeId].ToString()),
                    YearAdmittedAs = int.Parse(ObjectList[i][StudentDegree.ColYearAdmitted].ToString()),
                    AdmittedAs = (AdmissionEnum) (ObjectList[i][StudentDegree.ColAdmittedAs]),
                    Degree = getDegree(int.Parse(ObjectList[i][StudentDegree.ColDegreeId].ToString())),

                };
            }
            throw new NotImplementedException();
        }

        public Degree getDegree(int studentDegreeId)
        {
            var degreeDB = new DBMySqlGetDegreeList();
            degreeDB.ExecuteQuery();

            for (int i = 0; i < degreeDB.degreeList.Length; i++)
            {
                if (degreeDB.degreeList[i].Id == studentDegreeId)
                {
                    return degreeDB.degreeList[i];
                }
            }
            return null;
        }

        
    }
}