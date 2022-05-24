using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using Microsoft.AspNetCore.Identity;
using SiangShop.Entity;

namespace SiangShop.Models
{
    public class EntityMember:ConnectionString
    {
        [Display(Name = "ชื่อผู้ใช้")]
        [Required(ErrorMessage = "กรุณาเพิ่มข้อมูล ชื่อผู้ใช้")]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "กรุณาเพิ่มข้อมูล {2} ถึง {1} ตัวอักษร")]
        public string userID { get; set; }

        [Display(Name = "รหัสผ่าน")]
        [Required(ErrorMessage = "กรุณาเพิ่มข้อมูล รหัสผ่าน")]
        [DataType(DataType.Password)]
        [StringLength(25, MinimumLength = 10, ErrorMessage = "กรุณาเพิ่มข้อมูล {2} ถึง {1} ตัวอักษร")]
        public string password { get; set; }

        [Display(Name = "ยืนยันรหัสผ่าน")]
        [Required(ErrorMessage = "กรุณายืนยันรหัสผ่าน")]
        [DataType(DataType.Password)]
        [Compare("password", ErrorMessage = "รหัสผ่านไม่ตรงกัน")]
        [StringLength(25, MinimumLength = 10, ErrorMessage = "กรุณาเพิ่มข้อมูล {2} ถึง {1} ตัวอักษร")]
        public string confirmPassword { get; set; }

        [Display(Name = "ชื่อ")]
        [Required(ErrorMessage = "กรุณาเพิ่มข้อมูล ชื่อ")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "กรุณาเพิ่มข้อมูล {2} ถึง {1} ตัวอักษร")]
        public string name { get; set; }

        [Display(Name = "นามสกุล")]
        [Required(ErrorMessage = "กรุณาเพิ่มข้อมูล นามสกุล")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "กรุณาเพิ่มข้อมูล {2} ถึง {1} ตัวอักษร")]

        public string lastname { get; set; }

        [Display(Name = "บ้านเลขที่")]
        [Required(ErrorMessage = "กรุณาเพิ่มข้อมูล บ้านเลขที่")]
        [StringLength(100, MinimumLength = 2, ErrorMessage = "กรุณาเพิ่มข้อมูล {2} ถึง {1} ตัวอักษร")]

        public string address { get; set; }

        [Display(Name = "ตำบล")]
        [Required(ErrorMessage = "กรุณาเพิ่มข้อมูล ตำบล")]
        [StringLength(100, MinimumLength = 2, ErrorMessage = "กรุณาเพิ่มข้อมูล {2} ถึง {1} ตัวอักษร")]

        public string district { get; set; }

        [Display(Name = "อำเภอ")]
        [Required(ErrorMessage = "กรุณาเพิ่มข้อมูล อำเภอ")]
        [StringLength(100, MinimumLength = 2, ErrorMessage = "กรุณาเพิ่มข้อมูล {2} ถึง {1} ตัวอักษร")]

        public string amphur { get; set; }

        [Display(Name = "จังหวัด")]
        [Required(ErrorMessage = "กรุณาเพิ่มข้อมูล จังหวัด")]
        [StringLength(100, MinimumLength = 2, ErrorMessage = "กรุณาเพิ่มข้อมูล {2} ถึง {1} ตัวอักษร")]

        public string province { get; set; }

        [Display(Name = "รหัสไปรษณีย์")]
        [Required(ErrorMessage = "กรุณาเพิ่มข้อมูล รหัสไปรษณีย์")]
        [StringLength(5, MinimumLength = 5, ErrorMessage = "กรุณาเพิ่มข้อมูล {2} ถึง {1} ตัวอักษร")]

        public string zipcode { get; set; }

        [Display(Name = "ระดับสิทธิ์")]
        [Required(ErrorMessage = "กรุณาเพิ่มข้อมูล ระดับสิทธิ์")]
        public Nullable<int> role { get; set; }

        public Nullable<bool> status { get; set; }

        public void Insert()
        {
            var user = new User
            {
                userID = userID,
                password = HashPassword(password) ,
                name = name,
                lastname = lastname,
                address = address,
                district = district,
                amphur = amphur,
                province = province,
                zipcode = zipcode,
                role = role,
                status = true
            };
            _db.User.Add(user);
            _db.SaveChanges();
        }

        public void Update(EntityMember Value,string pass)
        {
            var user = new User
            {
                userID = Value.userID,
                password = pass,
                name = Value.name,
                lastname = Value.lastname,
                address = Value.address,
                district = Value.district,
                amphur = Value.amphur,
                province = Value.province,
                zipcode = Value.zipcode,
                role = Value.role,
                status = true

            };
            _db.Entry(user).State = EntityState.Modified;
            _db.SaveChanges();

        }
        public List<User> MemberList()
        {
            return _db.User.OrderBy(a => a.role).ThenBy(a => a.name).ToList();
        }
        public List<object> Select()
        {
            var data = (from r in MemberList()
                select new
                {
                    number = MemberList().FindIndex(a => a.userID == r.userID) + 1,
                    userID = r.userID,
                    password = r.password,
                    name = r.name,
                    lastname = r.lastname,
                    address = r.address,
                    district = r.district,
                    amphur = r.amphur,
                    province = r.province,
                    zipcode = r.zipcode,
                    role = r.role == 1 ? "ผู้ดูแลระบบ" : "พนักงาน",
                    keyRole = r.role,
                    status = r.status == true ? "ใช้งาน":"ระงับการใช้งาน"
                }).ToList();
            return new List<object>(data);
        }

        public EntityMember Detail(string id)
        {
            var data = _db.User.FirstOrDefault(a => a.userID.Equals(id));
            var user = new EntityMember
            {
                userID = data.userID,
                password = data.password,
                name = data.name,
                lastname = data.lastname,
                address = data.address,
                district = data.district,
                amphur = data.amphur,
                province = data.province,
                zipcode = data.zipcode,
                role = data.role
            };
            return user;
        }

        public void Remove(string id)
        {
            var data = _db.User.FirstOrDefault(a => a.userID.Equals(id));
            data.status = false;
            _db.Entry(data).State = EntityState.Modified;
            _db.SaveChanges();
        }
        
        public void Enable(string id)
        {
            var data = _db.User.FirstOrDefault(a => a.userID.Equals(id));
            data.status = true;
            _db.Entry(data).State = EntityState.Modified;
            _db.SaveChanges();
        }

        public void RePassWord(string id,string pass)
        {
            var data = _db.User.FirstOrDefault(a => a.userID.Equals(id));
            data.password = HashPassword(pass);
            _db.Entry(data).State = EntityState.Modified;
            _db.SaveChanges();
        }
        public User CooutUserID(string userid)
        {
            var data = _db.User.FirstOrDefault(a => a.userID.Equals(userid));
            if (data == null)
            {
                return data;
            }
            return data;
        }
        private string HashPassword(string password)
        {
            return GetMB5Hash(password);
        }

        private PasswordVerificationResult VerifyHashedPassword(string hashedPassword, string providedPassword)
        {
            if (hashedPassword == HashPassword(providedPassword))
            {
                return PasswordVerificationResult.Success;
            }
            else
            {
                return PasswordVerificationResult.Failed;
            }
        }

        private string GetMB5Hash(string GetPass)
        {
            byte[] bytes = Encoding.UTF8.GetBytes(GetPass);
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            bytes = md5.ComputeHash(bytes);
            StringBuilder stringBuilder = new StringBuilder();
            foreach (var item in bytes)
            {
                stringBuilder.Append(item.ToString("x2"));
            }

            return stringBuilder.ToString();
        }
    }

    public class Role
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

}