Spree::Core::Search::Variant.class_eval do
  self.search_terms = [
    :sku_cont,
    :product_name_cont,
    :product_slug_cont,
    :option_values_presentation_cont,
    :option_values_name_cont,
    :barcodes_code_cont,
    :barcodes_format_cont
  ]

end
