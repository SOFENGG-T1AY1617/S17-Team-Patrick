using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Database;
using SOFENGG_Order_Request_Document.View.Order.Interface;

namespace SOFENGG_Order_Request_Document.Presenter
{
    public class InfoMailDePresenter
    {
        IInfoMailDeView view;
        UserModel model;

        public InfoMailDePresenter(IInfoMailDeView view)
        {
            model = new UserModel();
            this.view = view;
        }

        public bool AddMailInfo()
        {
            var mailInfo = new MailingInfo()
            {
                MailingAddress = view.MailingAddress,
                StudentInfoId = view.StudentInfoId,
                ContactNo = view.MailingContactNo,
                DeliveryArea = model.GetDeliveryArea(view.DeliveryAreaId),
            };
            return model.AddMailingInfo(mailInfo);
        }

        public MailingInfo[] GetMailingInfoList()
        {
            return model.GetMailingInfo(view.StudentInfoId);
        }


    }
}