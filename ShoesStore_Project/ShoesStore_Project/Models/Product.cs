using System;
using System.Collections.Generic;

namespace ShoesStore_Project.Models
{
    public partial class Product
    {
        public Product()
        {
            OrderDetails = new HashSet<OrderDetail>();
            ProductDetails = new HashSet<ProductDetail>();
        }

        public int ProductId { get; set; }
        public string? Name { get; set; }
        public bool? Status { get; set; }
        public int? DisplayOrder { get; set; }
        public string? Image { get; set; }
        public decimal? Price { get; set; }
        public decimal? PromotionPrice { get; set; }
        public bool? Vat { get; set; }
        public int? Quantity { get; set; }
        public int? Warranty { get; set; }
        public DateTime? IsHot { get; set; }
        public string? Description { get; set; }
        public int? CateId { get; set; }
        public int? BrandId { get; set; }

        public virtual Brand? Cate { get; set; }
        public virtual ProductCategory? CateNavigation { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<ProductDetail> ProductDetails { get; set; }
    }
}
