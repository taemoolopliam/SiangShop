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
    
    public partial class Bill
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Bill()
        {
            this.Cheque = new HashSet<Cheque>();
        }
    
        public string billID { get; set; }
        public string saleID { get; set; }
        public Nullable<int> paymentType { get; set; }
        public Nullable<decimal> amount { get; set; }
        public string customerID { get; set; }
        public string userID { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual Sale Sale { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cheque> Cheque { get; set; }
    }
}
