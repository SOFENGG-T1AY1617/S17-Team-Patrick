using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlAddStudentDegree : DBMySqlConnection
    {
        public int StudentId { get; set; }
        protected StudentDegree StudentDegree;

        public DBMySqlAddStudentDegree(StudentDegree studentDegree)
        {
            StudentDegree = studentDegree;
        }

        public override bool ExecuteQuery()
        {
            try
            {
                var query = string.Format("INSERT INTO {0} ({1}, {2}, {3}, {4}) VALUES (@{1}, @{2}, @{3}, @{4});",
                    StudentDegree.Table, StudentDegree.ColIdStudent, StudentDegree.ColDegreeId, StudentDegree.ColYearAdmitted, StudentDegree.ColAdmittedAs);
                using (var cmd = new MySqlCommand(query, Conn))
                {
                    cmd.Parameters.AddWithValue("@" + StudentDegree.ColIdStudent, StudentDegree.ColIdStudent);
                    cmd.Parameters.AddWithValue("@" + StudentDegree.ColDegreeId, StudentDegree.Degree.Id);
                    cmd.Parameters.AddWithValue("@" + StudentDegree.ColYearAdmitted, StudentDegree.YearAdmitted);
                    cmd.Parameters.AddWithValue("@" + StudentDegree.ColAdmittedAs, StudentDegree.AdmittedAs);
                    cmd.Prepare();

                    return cmd.ExecuteNonQuery() > 0;
                }
            }
            finally
            {
                Close();
            }
        }
    }
}