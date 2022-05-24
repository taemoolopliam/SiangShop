using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using SiangShop.Entity;

namespace SiangShop.Models
{
    public class EntityCategory:ConnectionString
    {
        [Display(Name = "รหัสหมวดหมู่")]
        public string categoryID { get; set; }
        [Display(Name = "หมวดหมู่")]
        [Required(ErrorMessage = "กรุณาเพิ่มข้อมูล หมวดหมู่")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "กรุณาเพิ่มข้อมูล {2} ถึง {1} ตัวอักษร")]
        public string categoryName { get; set; }

        public Nullable<bool> status { get; set; }

        public void Insert(EntityCategory Value)
        {
            var category = new Category()
            {
                categoryID = AutoID(),
                categoryName = Value.categoryName,
                status = true
            };
            _db.Category.Add(category);
            _db.SaveChanges();
        }

        public void Update(EntityCategory Value)
        {
            var category = new Category()
            {
                categoryID = Value.categoryID,
                categoryName = Value.categoryName,
                status = true
            };
            _db.Entry(category).State = EntityState.Modified;
            _db.SaveChanges();
        }

        public List<Category> CategoryList()
        {
            return _db.Category.Where(a => a.status == true).ToList();
        }
        public List<object> Select()
        {
            var data = (from r in CategoryList()
                select new
                {
                    Number = CategoryList().FindIndex(a => a.categoryID == r.categoryID) + 1,
                    CategoryName = r.categoryName,
                    CategoryID = r.categoryID
                }).ToList();
            return new List<object>(data);
        }
        public void Remove(string id)
        {
            var data = _db.Category.FirstOrDefault(a => a.categoryID.Equals(id));
            data.status = false;
            _db.Entry(data).State = EntityState.Modified;
            _db.SaveChanges();

        }

        private string AutoID()
        {
            var count = _db.Category.Count();
            count++;
            return count.ToString("D5");
        }

        public EntityCategory Detail(string id)
        {
            var data = _db.Category.FirstOrDefault(a => a.categoryID.Equals(id));
            var category = new EntityCategory()
            {
                categoryID = data.categoryID,
                categoryName = data.categoryName,
                status = data.status
            };
            return category;
        }
    }
}