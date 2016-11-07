using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model.Database.Interface
{
    public class DBMySqlGetStudentInfo: DBMySqlSelectConnection
    {
        public StudentInfo studentInfo;

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format("SELECT * FROM {0}", StudentInfo.Table);

            //            Cmd.Parameters.AddWithValue("@name", "banana");
            Cmd.Prepare();
            throw new NotImplementedException();
        }

        public override void Parse()
        {
            studentInfo = new StudentInfo()
            {
                IdNumber = int.Parse(ObjectList[0][StudentInfo.ColId].ToString()),
                LastName = ObjectList[0][StudentInfo.ColLastName].ToString(),
                FirstName = ObjectList[0][StudentInfo.ColFirstName].ToString(),
                MiddleName = ObjectList[0][StudentInfo.ColMiddleName].ToString(),
                Gender = (GenderEnum)ObjectList[1][StudentInfo.ColGender],
                Email = ObjectList[0][StudentInfo.ColEmail].ToString(),
                BirthDate = (DateTime)ObjectList[0][StudentInfo.ColBirthDate],
                Citizenship = ObjectList[0][StudentInfo.ColCitizenship].ToString(),
                CurrentAddress = ObjectList[0][StudentInfo.ColAddress].ToString(),
                PhoneNumber = ObjectList[0][StudentInfo.ColPhoneNumber].ToString(),
                HighSchoolAttended = ObjectList[0][StudentInfo.ColHighSchoolAttended].ToString(),
                PlaceOfBirth = ObjectList[0][StudentInfo.ColPlaceOfBirth].ToString(),
            };
            
            throw new NotImplementedException();
        }

        
    }
}