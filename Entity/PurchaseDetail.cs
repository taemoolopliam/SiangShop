//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SiangShop.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class PurchaseDetail
    {
        public string purchaseDetailID { get; set; }
        public string purchaseID { get; set; }
        public string productID { get; set; }
        public Nullable<int> amount { get; set; }
        public Nullable<decimal> capitalPrice { get; set; }
    
        public virtual Product Product { get; set; }
        public virtual Purchase Purchase { get; set; }
    }
}