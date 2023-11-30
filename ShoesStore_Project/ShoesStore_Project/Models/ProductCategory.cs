using System;
using System.Collections.Generic;

namespace ShoesStore_Project.Models
{
    public partial class ProductCategory
    {
        public ProductCategory()
        {
            Products = new HashSet<Product>();
        }

        public int CateId { get; set; }
        public string? Name { get; set; }
        public bool? Status { get; set; }
        public int? DisplayOrder { get; set; }
        public int? ParentId { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
