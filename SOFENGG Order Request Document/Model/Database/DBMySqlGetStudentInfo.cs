using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model.Database.Interface
{
    public class DBMySqlGetStudentInfo: DBMySqlSelectConnection
    {
        public StudentInfo[] studentInfoList;

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format("SELECT * FROM {0}", StudentInfo.Table);

            //            Cmd.Parameters.AddWithValue("@name", "banana");
            Cmd.Prepare();
        }

        public override void Parse()
        {
            studentInfoList = new StudentInfo[ObjectList.Length];
            for (int i = 0; i < studentInfoList.Length; i++)
            {
                studentInfoList[i] = new StudentInfo()
                {
                    StudentInfoId = int.Parse(ObjectList[i][StudentInfo.ColStudentInfoId].ToString()),
                    LastName = ObjectList[i][StudentInfo.ColLastName].ToString(),
                    FirstName = ObjectList[i][StudentInfo.ColFirstName].ToString(),
                    MiddleName = ObjectList[i][StudentInfo.ColMiddleName].ToString(),
                    Gender = (GenderEnum)(ObjectList[i][StudentInfo.ColGender].ToString()[0]),
                    Email = ObjectList[0][StudentInfo.ColEmail].ToString(),
                    BirthDate = Convert.ToDateTime(ObjectList[i][StudentInfo.ColBirthDate].ToString()),
                    Citizenship = ObjectList[i][StudentInfo.ColCitizenship].ToString(),
                    CurrentAddress = ObjectList[i][StudentInfo.ColAddress].ToString(),
                    PhoneNumber = ObjectList[i][StudentInfo.ColPhoneNumber].ToString(),
                    HighSchoolAttended = ObjectList[i][StudentInfo.ColHighSchoolAttended].ToString(),
                    PlaceOfBirth = ObjectList[i][StudentInfo.ColPlaceOfBirth].ToString(),
                };
            }
            
        
        }

        
    }
}