using Abp.Web.Mvc.Views;

namespace RequestDocuments.Web.Views
{
    public abstract class RequestDocumentsWebViewPageBase : RequestDocumentsWebViewPageBase<dynamic>
    {

    }

    public abstract class RequestDocumentsWebViewPageBase<TModel> : AbpWebViewPage<TModel>
    {
        protected RequestDocumentsWebViewPageBase()
        {
            LocalizationSourceName = RequestDocumentsConsts.LocalizationSourceName;
        }
    }
}