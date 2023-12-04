using System;
using System.Collections.Generic;

namespace ShoesStore.Models
{
    public partial class ProductDetail
    {
        public int DetailsId { get; set; }
        public int? ProductId { get; set; }
        public int? ColorId { get; set; }
        public int? SizeId { get; set; }
        public int? Quantity { get; set; }

        public virtual Color? Color { get; set; }
        public virtual Product? Product { get; set; }
        public virtual Size? Size { get; set; }
    }
}
