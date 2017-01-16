Spree::Product.class_eval do
  has_many :barcodes,   dependent: :destroy
  self.whitelisted_ransackable_associations = %w[stores variants_including_master master variants barcodes]
end
