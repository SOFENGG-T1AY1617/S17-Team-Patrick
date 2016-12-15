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

        public HttpCookie DeleteMailInfoCookie(HttpCookie mailCookie, int deleteId)
        {
            var idString = mailCookie["Id"].Split('|');
            var mailingAddressString = mailCookie["MailingAddress"].Split('|');
            var contactNoString = mailCookie["ContactNo"].Split('|');
            var deliveryAreaString = mailCookie["DeliveryArea"].Split('|');
            var zipcodeString = mailCookie["Zipcode"].Split('|');

            mailCookie["Id"] = "";
            mailCookie["MailingAddress"] = "";
            mailCookie["ContactNo"] = "";
            mailCookie["DeliveryArea"] = "";
            mailCookie["Zipcode"] = "";

            var str = "|";

            for (int i = 0; i < idString.Length; i++)
            {
                if (i == idString.Length - 1) str = "";
                if (i == deleteId) continue;
                mailCookie["Id"] += idString[i] + str;
                mailCookie["MailingAddress"] += mailingAddressString[i] + str;
                mailCookie["ContactNo"] += contactNoString[i] + str;
                mailCookie["DeliveryArea"] += deliveryAreaString[i] + str;
                mailCookie["Zipcode"] += zipcodeString[i] + str;
            }

            return mailCookie;
        }

        public HttpCookie AddMailInfoCookie(HttpCookie mailCookie, int editId)
        {
            try
            {
                var idString = mailCookie["Id"].Split('|');
                var mailingAddressString = mailCookie["MailingAddress"].Split('|');
                var contactNoString = mailCookie["ContactNo"].Split('|');
                var deliveryAreaString = mailCookie["DeliveryArea"].Split('|');
                var zipcodeString = mailCookie["Zipcode"].Split('|');

                mailCookie["Id"] = "";
                mailCookie["MailingAddress"] = "";
                mailCookie["ContactNo"] = "";
                mailCookie["DeliveryArea"] = "";
                mailCookie["Zipcode"] = "";

                var str = "|";
                var mailInfoNum = idString.Length;
                if (editId == idString.Length)
                    mailInfoNum += 1;

                for (int i = 0; i < mailInfoNum; i++)
                {
                    if (i == mailInfoNum - 1) str = "";

                    if (i != editId)
                    {
                        mailCookie["Id"] += idString[i] + str;
                        mailCookie["MailingAddress"] += mailingAddressString[i] + str;
                        mailCookie["ContactNo"] += contactNoString[i] + str;
                        mailCookie["DeliveryArea"] += deliveryAreaString[i] + str;
                        mailCookie["Zipcode"] += zipcodeString[i] + str;
                    }
                    else
                    {
                        mailCookie["Id"] += i + str;
                        mailCookie["MailingAddress"] += view.MailingAddress + str;
                        mailCookie["ContactNo"] += view.MailingContactNo + str;
                        mailCookie["DeliveryArea"] += model.GetDeliveryArea(view.DeliveryAreaId).Id + str;
                        mailCookie["Zipcode"] += view.Zipcode + "";
                    }
                }

            }
            catch (NullReferenceException)
            {
                mailCookie = new HttpCookie("MailInformation");
                mailCookie["Id"] += 0 + "";
                mailCookie["MailingAddress"] += view.MailingAddress;
                mailCookie["ContactNo"] += view.MailingContactNo;
                mailCookie["DeliveryArea"] += model.GetDeliveryArea(view.DeliveryAreaId).Id;
                mailCookie["Zipcode"] += view.Zipcode + "";
            }

            return mailCookie;
        }



        public HttpCookie AddMailInfoCookie2(int studentInfoId, int mailId)
        {
            int id = mailId;
            MailingInfo[] mailInfo = model.GetMailingInfo(studentInfoId);
            HttpCookie cookie;
            cookie = new HttpCookie("MailInformation");
            cookie["MailingAddress"] = cookie["MailingAddress"] + "|" + view.MailingAddress;
            cookie["ContactNo"] = cookie["ContactNo"] + "|" +  view.MailingContactNo;
            cookie["DeliveryArea"] = cookie["DeliveryArea"] + "|" + model.GetDeliveryArea(view.DeliveryAreaId).Id + "";
            cookie["Zipcode"] = cookie["Zipcode"] + "|" + view.Zipcode + "";
            cookie["Id"] = cookie["Id"] + "|" + mailId;

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