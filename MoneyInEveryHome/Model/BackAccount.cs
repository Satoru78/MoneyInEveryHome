//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MoneyInEveryHome.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class BackAccount
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public BackAccount()
        {
            this.History = new HashSet<History>();
        }
    
        public int NumberAccount { get; set; }
        public int UserID { get; set; }
        public System.DateTime DateOpen { get; set; }
        public decimal Balance { get; set; }
        public int Type { get; set; }
    
        public virtual Type Type1 { get; set; }
        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<History> History { get; set; }
    }
}
