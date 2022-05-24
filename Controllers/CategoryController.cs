using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SiangShop.Models;

namespace SiangShop.Controllers
{
    public class CategoryController : Controller
    {
        private EntityCategory _category = new EntityCategory();
        public JsonResult LoadData()
        {
            
            return Json(_category.Select(), JsonRequestBehavior.AllowGet);
        }

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(EntityCategory Value)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (!Value.categoryID.Equals("0"))
                    {
                        Value.Update(Value);
                    }
                    else
                    {
                        Value.Insert(Value);
                    }
                    return Json(true, JsonRequestBehavior.AllowGet);

                }
                return Json(false, JsonRequestBehavior.AllowGet);

            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult Delete(string id)
        {
            try
            {
                _category.Remove(id);
                return Json(true, JsonRequestBehavior.AllowGet);

            }
            catch (Exception e)
            {
                return Json(e.Message, JsonRequestBehavior.AllowGet);
            }
            return Json(false, JsonRequestBehavior.AllowGet);
        }

    }
}
