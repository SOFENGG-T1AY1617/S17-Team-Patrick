using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SOFENGG_Order_Request_Document.View.Order.Interface
{
    public interface IInfoAcadDeView
    {
        int StudentInfoId { get; set; }
        int IdNumber{get; set; }
        int CampusAttended { get; set; }
        char Level { get; set; }
        bool IsGraduate { get; set; }
        String Degree { get; set; }
        char AdmittedAs { get; set; }
        int YearAdmitted { get; set; }
    }
}
