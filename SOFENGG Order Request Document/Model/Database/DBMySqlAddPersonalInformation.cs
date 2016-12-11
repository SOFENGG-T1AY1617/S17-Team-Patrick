using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlAddPersonalInformation : DBMySqlConnection
    {
        public int StudentId { get; set; }
        protected StudentInfo StudentInfo;

        public DBMySqlAddPersonalInformation(StudentInfo studentInfo)
        {
            StudentInfo = studentInfo;
        }

        public override bool ExecuteQuery()
        {
            try
            {
                var query =
                    string.Format(
                        "INSERT INTO {0} ({1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {9}, {10}, {11}) VALUES (@{1}, @{2}, @{3}, @{4}, @{5}, @{6}, @{7}, @{8}, @{9}, @{10}, @{11});",
                        StudentInfo.Table, StudentInfo.ColLastName, StudentInfo.ColFirstName, StudentInfo.ColMiddleName,
                        StudentInfo.ColGender, StudentInfo.ColEmail, StudentInfo.ColBirthDate, StudentInfo.ColCitizenship,
                        StudentInfo.ColAddress, StudentInfo.ColPhoneNumber, StudentInfo.ColHighSchoolAttended, StudentInfo.ColPlaceOfBirth);

                using (var cmd = new MySqlCommand(query, Conn))
                {
                    cmd.Parameters.AddWithValue("@" + StudentInfo.ColLastName, StudentInfo.LastName);
                    cmd.Parameters.AddWithValue("@" + StudentInfo.ColFirstName, StudentInfo.FirstName);
                    cmd.Parameters.AddWithValue("@" + StudentInfo.ColMiddleName, StudentInfo.MiddleName);
                    cmd.Parameters.AddWithValue("@" + StudentInfo.ColGender, (char)StudentInfo.Gender);
                    cmd.Parameters.AddWithValue("@" + StudentInfo.ColEmail, StudentInfo.Email);
                    cmd.Parameters.AddWithValue("@" + StudentInfo.ColBirthDate, StudentInfo.BirthDate);
                    cmd.Parameters.AddWithValue("@" + StudentInfo.ColCitizenship, StudentInfo.Citizenship);
                    cmd.Parameters.AddWithValue("@" + StudentInfo.ColAddress, StudentInfo.CurrentAddress);
                    cmd.Parameters.AddWithValue("@" + StudentInfo.ColPhoneNumber, StudentInfo.PhoneNumber);
                    cmd.Parameters.AddWithValue("@" + StudentInfo.ColHighSchoolAttended, StudentInfo.HighSchoolAttended);
                    cmd.Parameters.AddWithValue("@" + StudentInfo.ColPlaceOfBirth, StudentInfo.PlaceOfBirth);
                    cmd.Prepare();



                    return cmd.ExecuteNonQuery() > 0;
                }
            }
            finally
            {
                Close();
            }
        }

        public bool SetStudentInfoId()
        {
            DataRow[] ObjectList;
            MySqlCommand Cmd;
            try
            {
                using (Cmd =
                    new MySqlCommand())
                {
                    Cmd.Connection = Conn;
                    var query = string.Format("SELECT MAX(studentInfoId) FROM {0}", StudentInfo.Table);

                    using (var dt = new DataTable())
                    {
                        dt.Load(Cmd.ExecuteReader());
                        ObjectList = dt.AsEnumerable().ToArray();
                        //var value = rows[0]["id"];
                        StudentInfo.StudentInfoId = int.Parse(ObjectList[0][StudentInfo.ColStudentInfoId].ToString());
                    }
                    

                    return ObjectList != null;
                }
            }
            finally
            {
                Close();
            }
        }
    }

}