using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SiangShop.Models;

namespace SiangShop.Controllers
{
    public class BrandController : Controller
    {
        private EntityBrand _brand = new EntityBrand();
        public ActionResult Index()
        {
            EntityCategory _category = new EntityCategory();
            ViewBag.categoryID = ViewBag.categoryID = new SelectList(_category.CategoryList(), "categoryID", "categoryName");
            return View();
        }

        public JsonResult LoadData()
        {
            return Json(_brand.Select(), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Create(EntityBrand Value)
        {
            try
            {

                if (Value.brandID.Equals("0"))
                {
                    Value.Insert(Value);
                }
                else
                {
                    Value.Update(Value);
                }

                return Json(true, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return Json(e.Message, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public ActionResult Delete(string id)
        {
            try
            {
                _brand.Remove(id);
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return Json(e.Message, JsonRequestBehavior.AllowGet);
            }
        }
    }
}
