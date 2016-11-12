using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public enum AdmissionEnum
    {
        Regular = 0,
        Transferee = 1,
        Graduate = 2
    }

    public class StudentDegree
    {
        public const string Table = "studentdegree";
        public const string ColStudentDegreeId = "studentDegreeId";
        public const string ColIdStudent = "idNumber";
        public const string ColDegreeId = "degreeId";
        public const string ColYearAdmitted = "yearAdmitted";
        public const string ColAdmittedAs = "admittedAs";

        public int Id { get; set; }
        public int IdStudent { get; set; }
        public Degree Degree { get; set; }
        public int YearAdmitted { get; set; }
        public AdmissionEnum AdmittedAs { get; set; }
    }
}