﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SOFENGG_Order_Request_Document.Model;

namespace SOFENGG_Order_Request_Document.View.Order.Interface
{
    public interface IOrderDocumentListView
    {
        Document[] AvailableDocumentList { set; }
        void GetDocumentList();
    }
}