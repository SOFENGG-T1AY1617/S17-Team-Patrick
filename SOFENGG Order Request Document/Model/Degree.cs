using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOFENGG_Order_Request_Document.Model
{
    public enum DegreeLevelEnum
    {
        Bachelors = 'U',
        Masters = 'M',
        Doctorate = 'D'
    }
    public enum CampusEnum
    {
        Taft = 1,
        STC = 2,
        Makati = 3,
    }

    public class Degree
    {
        public const string Table = "degree";
        public const string ColDegreeId = "degreeId";
        public const string ColDegreeAbbrv = "degreeAbbrv";
        public const string ColCampusOfferedId = "campusOfferedId";
        public const string ColDegreeName = "degreeName";
        public const string ColLevel = "level";

        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public DegreeLevelEnum Level { get; set; }
        public CampusEnum CampusOffered { get; set; }

    }
}