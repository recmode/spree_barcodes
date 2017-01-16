module Spree
  module Admin
    class BarcodesController < ResourceController

      before_action :load_data
      before_action :set_product_variant, only: [:update,:create]
      before_action :set_barcodes, only: :index

      private

      def set_barcodes
        @barcodes = @variant.barcodes.order(position: :asc)
      end

      def location_after_save
        admin_product_variant_barcodes_path(@product,@variant)
      end

      def load_data
        @product = Spree::Product.friendly.find(params[:product_id])
        @variant = Spree::Variant.find(params[:variant_id]) || Spree::Variant.new
      end

      def set_product_variant
        @barcode.variant = @variant
        @barcode.product = @product
      end

    end
  end
end
