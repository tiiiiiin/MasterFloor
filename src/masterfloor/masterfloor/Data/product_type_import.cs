//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace masterfloor.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class product_type_import
    {
        public int Id { get; set; }
        public int IdTypeProduct { get; set; }
        public decimal CoefProduct { get; set; }
    
        public virtual TypeProduct TypeProduct { get; set; }
    }
}
