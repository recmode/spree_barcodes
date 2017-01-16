module Spree

  class Barcode < Spree::Base

    require 'ean'
    belongs_to :variant
    belongs_to :product
    acts_as_list scope: :variant

    before_create :set_format
    before_update :set_format
    validates_length_of :code, :minimum => 5, :maximum => 14


    self.whitelisted_ransackable_attributes = %w[format code]


    def set_format

      code = self.code
      format = nil
      if code && code.ean?
        case code.size
        when 5
          format = 'UPC'
        when 8
          format = 'EAN'
        when 12
          format = 'UPC'
        when 13
          format = 'EAN'
        when 14
          format = 'EAN'
          if code[0] == '0'
            code = code[1..-1]
          end
        end
      else
        format = 'Unknown'
      end
      self.format = format
    end

  end

end
