using System;
using System.Data;

namespace SOFENGG_Order_Request_Document.Model.Database.OrderInformation
{
    public class DBMySqlGetStudentInfo : DBMySqlSelectConnection
    {
        public StudentInfo StudentInfo;

        private readonly int _studentInfoId;

        public DBMySqlGetStudentInfo(int studentInfoId)
        {
            _studentInfoId = studentInfoId;
        }

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format(
                @"SELECT *
                FROM {0}
                WHERE {1} = @{1}
                ", StudentInfo.Table,
                StudentInfo.ColStudentInfoId);

            Cmd.Parameters.AddWithValue("@" + StudentInfo.ColStudentInfoId, _studentInfoId);
            Cmd.Prepare();
        }

        public override void Parse()
        {
            if (ObjectList == null || ObjectList.Length == 0)
                throw new NoNullAllowedException(string.Format("No student found on studentInfoId = '{0}'",
                    _studentInfoId));

            StudentInfo = new StudentInfo
            {
                LastName = ObjectList[0][StudentInfo.ColLastName].ToString(),
                MiddleName = ObjectList[0][StudentInfo.ColMiddleName].ToString(),
                FirstName = ObjectList[0][StudentInfo.ColFirstName].ToString(),
                BirthDate = DateTime.Parse(ObjectList[0][StudentInfo.ColBirthDate].ToString()),
                Citizenship = ObjectList[0][StudentInfo.ColCitizenship].ToString(),
                CurrentAddress = ObjectList[0][StudentInfo.ColAddress].ToString(),
                Email = ObjectList[0][StudentInfo.ColEmail].ToString(),
                Gender = (GenderEnum) char.Parse(ObjectList[0][StudentInfo.ColGender].ToString()),
                HighSchoolAttended = ObjectList[0][StudentInfo.ColHighSchoolAttended].ToString(),
                PhoneNumber = ObjectList[0][StudentInfo.ColPhoneNumber].ToString(),
                PlaceOfBirth = ObjectList[0][StudentInfo.ColPlaceOfBirth].ToString()
            };
        }
    }
}