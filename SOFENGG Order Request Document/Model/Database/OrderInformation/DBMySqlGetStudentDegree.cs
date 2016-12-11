using System;
using System.Data;

namespace SOFENGG_Order_Request_Document.Model.Database.OrderInformation
{
    public class DBMySqlGetStudentDegree : DBMySqlSelectConnection
    {
        public StudentDegree StudentDegree;

        private readonly int _studentDegreeId;

        public DBMySqlGetStudentDegree(int studentDegreeId)
        {
            _studentDegreeId = studentDegreeId;
        }

        protected override void SetQuery()
        {
            Cmd.CommandText = string.Format(
                @"SELECT * FROM {0} NATURAL JOIN {2} WHERE {1} = @{1}
                ", StudentDegree.Table, StudentDegree.ColStudentDegreeId, Degree.Table);

            Cmd.Parameters.AddWithValue("@" + StudentDegree.ColStudentDegreeId, _studentDegreeId);
            Cmd.Prepare();
        }

        public override void Parse()
        {
            if (ObjectList == null || ObjectList.Length == 0)
                throw new NoNullAllowedException(string.Format("No studentDegree found on studentDegreeId = '{0}'",
                    _studentDegreeId));

            StudentDegree = new StudentDegree
            {
                Id = int.Parse(ObjectList[0][StudentDegree.ColStudentDegreeId].ToString()),
                AdmittedAs = (AdmissionEnum) int.Parse(ObjectList[0][StudentDegree.ColAdmittedAs].ToString()),
                Degree = new Degree
                {
                    CampusOffered = (CampusEnum) int.Parse(ObjectList[0][Degree.ColCampusOfferedId].ToString()),
                    Code = ObjectList[0][Degree.ColDegreeAbbrv].ToString(),
                    Name = ObjectList[0][Degree.ColDegreeName].ToString(),
                    Level = (DegreeLevelEnum) char.Parse(ObjectList[0][Degree.ColLevel].ToString())
                },
                IdStudent = int.Parse(ObjectList[0][StudentDegree.ColIdStudent].ToString()),
                YearAdmitted = int.Parse(ObjectList[0][StudentDegree.ColYearAdmitted].ToString())
            };
        }
    }
}