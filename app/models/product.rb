class Product < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  
  has_attached_file :image_url,
    styles: { normal: "1000x1000#", thumb: "300x300#" },
    url: '/photos/products/image_url/:id/:style_:basename.:extension',
    default_style: :normal,
    preserve_files: true,
    processors: [:thumbnail, :compression]
    
  validates_attachment :image_url, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  
  def self.latest
    Product.order(:update_at).last
  end
  
  private
    # ensure that there are no line items referencing this product
    
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
