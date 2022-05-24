using SiangShop.Entity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace SiangShop.Models
{
    public class EntityProduct : ConnectionString
    {
        [Display(Name = "รหัสสินค้า")]
        public string productID { get; set; }
        [Display(Name = "ชื่อสินค้า")]
        [Required(ErrorMessage = "กรุณาเพิ่มข้อมูล ชื่อสินค้า")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "กรุณาเพิ่มข้อมูล {2} ถึง {1} ตัวอักษร")]
        public string productName { get; set; }
        [Display(Name = "จำนวนสินค้า")]
        [Required(ErrorMessage = "กรุณาเพิ่มข้อมูล จำนวนสินค้า")]
        [Range(0, int.MaxValue, ErrorMessage = "โปรดป้อนจำนวนเต็มที่ถูกต้อง")]
        public Nullable<int> amount { get; set; }
        [Display(Name = "บาร์โค้ด")]
        [StringLength(15, MinimumLength = 15, ErrorMessage = "กรุณาเพิ่มข้อมูล {2} ถึง {1} ตัวอักษร")]
        public string barcode { get; set; }
        [Display(Name = "หมวดหมู่")]
        [Required(ErrorMessage = "กรุณาเพิ่มข้อมูล หมวดหมู่")]
        public string categoryID { get; set; }
        [Display(Name = "ยี่ห้อสินค้า")]
        [Required(ErrorMessage = "กรุณาเพิ่มข้อมูล ยี่ห้อสินค้า")]
        public string brandID { get; set; }

        private string AutoKey()
        {
            var count = _db.Product.Count();
            count++;
            return count.ToString("D7");
        }
        public void Insert()
        {
            var data = new Product()
            {
                productID = AutoKey(),
                productName = productName,
                amount = amount,
                barcode = barcode,
                categoryID = categoryID,
                brandID = brandID
            };
            _db.Product.Add(data);
            _db.SaveChanges();
        }

        public void Update()
        {
            var data = new Product()
            {
                productID = productID,
                productName = productName,
                amount = amount,
                barcode = barcode,
                categoryID = categoryID,
                brandID = brandID,
                status = true
            };
            _db.Entry(data).State = EntityState.Modified;
            _db.SaveChanges();
        }

        public List<Product> ProductList()
        {
            return _db.Product.Where(a=>a.status == true).ToList();
        }

        public List<Object> Select()
        {
            var data = (from r in ProductList()
                select new
                {
                    Number = ProductList().FindIndex(a => a.productID.Equals(r.productID)) + 1,
                    productID = r.productID,
                    productName = r.productName,
                    amount = r.amount,
                    barcode = r.barcode,
                    categoryID = r.Brand.Category.categoryName,
                    brandID = r.Brand.brandName
                });
            return new List<object>(data);
        }

        public void Remove(string id)
        {
            var data = _db.Product.FirstOrDefault(a => a.productID.Equals(id));
            data.status = false;
            _db.Entry(data).State = EntityState.Modified;
            _db.SaveChanges();
        }
    }
}