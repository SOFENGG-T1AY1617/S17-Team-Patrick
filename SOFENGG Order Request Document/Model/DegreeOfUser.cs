namespace SOFENGG_Order_Request_Document.Model
{
    public class DegreeOfUser
    {
        public enum AdmittedAsEnum
        {
            Regular = 0,
            Transferee = 1,
            Graduate = 2
        }

        public const string Table = "degreesofuser";
        public const string ColDegreeId = "degreeID";
        public const string ColLevel = "level";
        public const string ColYearAdmitted = "yearAdmitted";
        public const string ColCampusId = "campusID";
        public const string ColAdmittedAs = "admittedAs";
        public const string ColGraduated = "graduated";
        public const string ColYearLevel = "yearLevel";
        public const string ColUserId = "userID";
        public const string ColLastSchoolAttended = "lastSchoolAttended";
        public const string ColGraduatedYear = "graduatedYear";
        public const string ColGraduatedMonth = "graduatedMonth";
        public const string ColTerm = "term";
        public const string ColAcademicYear = "academicYear";

        public int Id { get; set; }
        public Degree Degree { get; set; }

        // TODO:
        public int Level { get; set; }
        public int YearAdmitted { get; set; }
        public Campus Campus { get; set; }
        public AdmittedAsEnum AdmittedAs { get; set; }
        
        // TODO:
        public string Graduated { get; set; }

        public int YearLevel { get; set; }
        public User User { get; set; }
        public string LastSchoolAttended { get; set; }
        public int GraduatedYear { get; set; }
        public int GraduatedMonth { get; set; }
        public int Term { get; set; }
        public string AcademicYear { get; set; }


    }
}