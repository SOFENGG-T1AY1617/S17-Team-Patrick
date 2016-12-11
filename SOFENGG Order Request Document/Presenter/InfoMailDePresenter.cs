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

        public HttpCookie AddMailInfoCookie(int studentInfoId, int MailId)
        {
            MailingInfo[] mailInfo = model.GetMailingInfo(studentInfoId);
            HttpCookie cookie;
            int mailId = MailId;
            cookie = new HttpCookie("MailInformation" + MailId);
            cookie["MailingAddress"] = view.MailingAddress;
            cookie["ContactNo"] = view.MailingContactNo;
            cookie["DeliveryArea"] = model.GetDeliveryArea(view.DeliveryAreaId).Id + "";
            cookie["Zipcode"] = view.Zipcode + "";

            return cookie;
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

        public DeliveryArea[] GetDeliveryAreaList()
        {
            return model.GetAllDeliveryArea();
        }

        public DeliveryArea GetOneDeliveryArea(int deliveryId)
        {
            return model.GetDeliveryArea(deliveryId);
        }

    }
}