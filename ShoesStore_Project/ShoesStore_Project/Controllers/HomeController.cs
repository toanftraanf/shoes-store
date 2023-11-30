using Microsoft.AspNetCore.Mvc;

namespace ShoesStore_Project.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
