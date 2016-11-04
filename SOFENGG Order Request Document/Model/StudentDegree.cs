﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public enum AdmissionEnum
    {
        Regular,
        Transferee,
        Graduate
    }

    public class StudentDegree
    {
        public const string Table = "studentdegree";
        public const string ColStudentDegreeId = "studentDegreeId";
        public const string ColIdNumber = "idNumber";
        public const string ColDegreeId = "degreeId";
        public const string ColYearAdmitted = "yearAdmitted";
        public const string ColAdmittedAs = "admittedAs";

        public int Id { get; set; }
        public int YearAdmittedAs { get; set; }
        public AdmissionEnum AdmittedAs { get; set; }
        public Degree Degree { get; set; }
    }
}