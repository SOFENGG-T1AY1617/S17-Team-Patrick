using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SOFENGG_Order_Request_Document.Model;

namespace SOFENGG_Order_Request_Document.View.Admin.Interface
{
    public interface IManageOperationalDateView
    {
        void AddDate(DateTime date);
        void GetOfflineDates();
        void RemoveOfflineDate(DateTime date);
    }
}
