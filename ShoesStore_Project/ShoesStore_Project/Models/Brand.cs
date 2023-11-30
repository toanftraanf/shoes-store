using System;
using System.Collections.Generic;

namespace ShoesStore_Project.Models
{
    public partial class Brand
    {
        public Brand()
        {
            Products = new HashSet<Product>();
        }

        public int BrandId { get; set; }
        public string? Name { get; set; }
        public int? DisplayOrder { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
