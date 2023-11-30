using System;
using System.Collections.Generic;

namespace ShoesStore_Project.Models
{
    public partial class Size
    {
        public Size()
        {
            ProductDetails = new HashSet<ProductDetail>();
        }

        public int SizeId { get; set; }
        public string? Name { get; set; }

        public virtual ICollection<ProductDetail> ProductDetails { get; set; }
    }
}
