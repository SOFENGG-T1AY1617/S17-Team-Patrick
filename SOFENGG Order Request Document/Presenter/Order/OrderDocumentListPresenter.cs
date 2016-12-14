using SOFENGG_Order_Request_Document.Model;
using SOFENGG_Order_Request_Document.Model.Database;
using SOFENGG_Order_Request_Document.Model.Helper;
using SOFENGG_Order_Request_Document.View.Order.Interface;
using System;
using System.Collections.Generic;
using System.Linq;

namespace SOFENGG_Order_Request_Document.Presenter.Order
{
    public class OrderDocumentListPresenter
    {
        private readonly IOrderModel _model;
        private readonly IUserModel _umodel;
        private readonly IOrderDocumentListView _view;
        // private FormatParser formatParser;

        public class DocumentGroup
        {
            public string Category { get; set; }
            public List<Document> DocumentList { get; set; }
        }

        public OrderDocumentListPresenter(IOrderDocumentListView view)
        {
            _view = view;
            _model = new OrderModel();
            _umodel = new UserModel();
        }

        public DocumentGroup[] GetDocumentListSortByCategory(int[] degreeIdList)
        {
            var documentList = _model.GetDocumentList(degreeIdList);

            if (documentList == null || documentList.Length <= 0)
                return null;

            var groupList = new List<DocumentGroup>();

            var enumList = Enum.GetValues(typeof(DocumentCategoryEnum));
            for (var i = 0; i < enumList.Length; i++)
                groupList.Add(new DocumentGroup { Category = ((DocumentCategoryEnum)enumList.GetValue(i)).GetDescription(), DocumentList = new List<Document>() });

            var sortedGroupList = groupList.ToArray();

            Array.Sort(sortedGroupList,
                (x, y) => string.Compare(x.Category, y.Category, StringComparison.Ordinal));

            var currGroup = sortedGroupList[0];
            for (var i = 0; i < documentList.Length; i++)
            {
                var category = documentList[i].Category.GetDescription();
                if (category != currGroup.Category)
                    currGroup = sortedGroupList.First(x => x.Category == category);

                currGroup.DocumentList.Add(documentList[i]);
            }

            return groupList.ToArray();
        }

        /* public OrderDocumentListPresenter(FormatParser formatParser)
         {
             this.formatParser = formatParser;
         } */

        /*public void GetDocumentList()
        {
            _view.AvailableDocumentList = _model.GetDocumentList();
        }*/
    }
}