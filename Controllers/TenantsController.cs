using System.Web.Mvc;
using Abp.Web.Mvc.Authorization;
using RequestDocuments.Authorization;
using RequestDocuments.MultiTenancy;

namespace RequestDocuments.Web.Controllers
{
    [AbpMvcAuthorize(PermissionNames.Pages_Tenants)]
    public class TenantsController : RequestDocumentsControllerBase
    {
        private readonly ITenantAppService _tenantAppService;

        public TenantsController(ITenantAppService tenantAppService)
        {
            _tenantAppService = tenantAppService;
        }

        public ActionResult Index()
        {
            var output = _tenantAppService.GetTenants();
            return View(output);
        }
    }
}