using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SiangShop.Models;

namespace SiangShop.Controllers
{
    public class MemberController : Controller
    {
        private EntityMember _member = new EntityMember();
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult LoadData()
        {
            return Json(_member.Select(), JsonRequestBehavior.AllowGet);
        }
        public ActionResult Details(int id)
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(EntityMember value)
        {
            try
            {
                var data = _member.CooutUserID(value.userID);
                if (data == null)
                {
                    value.Insert();
                }
                else
                {
                    value.Update(value,data.password);
                }

                return Json(true, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return Json(e.Message, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult Edit(int id)
        {
            return View();
        }

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        public JsonResult Delete(string id)
        {
            try
            {
                _member.Remove(id);
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return Json(e.Message, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult Enable(string id)
        {
            try
            {
                _member.Enable(id);
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return Json(e.Message, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult RePass(string id,string in_repass)
        {
            try
            {
                _member.RePassWord(id,in_repass);
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return Json(e.Message, JsonRequestBehavior.AllowGet);
            }
        }
    }
}
