using System;
using System.Collections.Generic;

namespace ShoesStore.Models
{
    public partial class Color
    {
        public Color()
        {
            ProductDetails = new HashSet<ProductDetail>();
        }

        public int ColorId { get; set; }
        public string? Name { get; set; }

        public virtual ICollection<ProductDetail> ProductDetails { get; set; }
    }
}
