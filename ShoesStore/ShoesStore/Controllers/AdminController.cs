using Microsoft.AspNetCore.Mvc;
using ShoesStore.Models;

namespace ShoesStore.Controllers
{
    public class AdminController : Controller
    {
        private readonly ShoesStoreContext _context = new ShoesStoreContext();
        public IActionResult Dashboard()
        {
            return View();
        }
        public IActionResult Users()
        {
            var userList = _context.Users.ToList();
            return View(userList);
        }
    }
}
