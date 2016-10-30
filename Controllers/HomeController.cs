using System.Web.Mvc;
using Abp.Web.Mvc.Authorization;

namespace RequestDocuments.Web.Controllers
{
    [AbpMvcAuthorize]
    public class HomeController : RequestDocumentsControllerBase
    {
        public ActionResult Index()
        {
            return View();
        }
	}
}