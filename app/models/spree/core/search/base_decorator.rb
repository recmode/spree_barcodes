Spree::Core::Search::Base.class_eval do

  class_attribute :search_terms
  self.search_terms = [
    :name_cont,
    :description_cont,
    :barcodes_code_cont
  ]

  protected
  # method should return new scope based on base_scope
  def get_products_conditions_for(base_scope, query)
    unless query.blank?
      matches = query.split.map do |word|
        base_scope.ransack(search_term_params(word)).result.pluck(:id)
      end
      base_scope = Spree::Product.where(id: matches.inject(:&))
    end
    base_scope
  end

  private

  def search_term_params(word)
    terms = Hash[search_terms(word).map { |t| [t, word] }]
    terms.merge(m: 'or')
  end

  def search_terms(_word)
    self.class.search_terms
  end
end
