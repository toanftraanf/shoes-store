using Microsoft.AspNetCore.Mvc;

namespace ShoesStore.Controllers
{
    public class AuthController : Controller
    {
        public IActionResult Login()
        {
            return View();
        }
    }
}
