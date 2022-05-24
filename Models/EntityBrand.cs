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
    public class EntityBrand:ConnectionString
    {
        [Display(Name = "รหัสหมวดหมู่")]
        public string brandID { get; set; }
        [Display(Name = "ยี่ห้อสินค้า")]
        [Required(ErrorMessage = "กรุณาเพิ่มข้อมูล ยี่ห้อสินค้า")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "กรุณาเพิ่มข้อมูล {2} ถึง {1} ตัวอักษร")]
        public string brandName { get; set; }
        [Display(Name = "หมวดหมู่")]
        public string categoryID { get; set; }

        public Nullable<bool> status { get; set; }

        public void Insert(EntityBrand value)
        {
            var brand = new Brand()
            {
                brandID = autoKey(),
                brandName = value.brandName,
                categoryID = value.categoryID,
                status = true
            };
            _db.Brand.Add(brand);
            _db.SaveChanges();
        }

        public void Update(EntityBrand value)
        {
            var brand = new Brand()
            {
                brandID = value.brandID,
                brandName = value.brandName,
                categoryID = value.categoryID,
                status = true
            };
            _db.Entry(brand).State = EntityState.Modified;
            _db.SaveChanges();
        }

        public List<Brand> BrandList()
        {
            return _db.Brand.Where(a => a.status == true).ToList();
        }
        public List<object> Select()
        {
            var data = (from r in BrandList()
                select new
                {
                    Number = BrandList().FindIndex(a => a.brandID == r.brandID) + 1,
                    BrandID = r.brandID,
                    BrandName = r.brandName,
                    CategoryName = r.Category.categoryName,
                    categoryID = r.categoryID
                });
            return new List<object>(data);
        }
        public void Remove(string id)
        {
            var data = _db.Brand.FirstOrDefault(a => a.brandID.Equals(id));
            data.status = false;
            _db.Entry(data).State = EntityState.Modified;
            _db.SaveChanges();
        }

        private string autoKey()
        {
            var count = _db.Brand.Count();
            count++;
            return count.ToString("D5");
        }
    }
}