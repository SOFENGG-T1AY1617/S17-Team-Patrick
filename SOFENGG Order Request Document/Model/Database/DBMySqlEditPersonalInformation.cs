using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace SOFENGG_Order_Request_Document.Model.Database
{
    public class DBMySqlEditPersonalInformation: DBMySqlConnection
    {
        protected StudentInfo StudentInfo;

        public DBMySqlEditPersonalInformation(StudentInfo studentInfo)
        {
            StudentInfo = studentInfo;
        }

        public override bool ExecuteQuery()
        {
            try
            {
                var query = string.Format("UPDATE {0} SET {1}=@{1}, {2}=@{2}, {3}=@{3}, {4}=@{4}, {5}=@{5}, {6}=@{6}, {7}=@{7}, {8}=@{8}, {9}=@{9}, {10}=@{10}, {11}=@{11} WHERE {12}=@{12}",
                    StudentInfo.Table, StudentInfo.ColLastName, StudentInfo.ColFirstName, StudentInfo.ColMiddleName, StudentInfo.ColGender, StudentInfo.ColEmail,
                    StudentInfo.ColBirthDate, StudentInfo.ColCitizenship, StudentInfo.ColAddress, StudentInfo.ColPhoneNumber, 
                    StudentInfo.ColHighSchoolAttended, StudentInfo.ColPlaceOfBirth, StudentInfo.ColStudentInfoId);
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
                    cmd.Parameters.AddWithValue("@" + StudentInfo.ColStudentInfoId, StudentInfo.StudentInfoId);
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