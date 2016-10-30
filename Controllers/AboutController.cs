using System.Web.Mvc;

namespace RequestDocuments.Web.Controllers
{
    public class AboutController : RequestDocumentsControllerBase
    {
        public ActionResult Index()
        {
            return View();
        }
	}
}