module Svpply
  module Products
    def product(id)
      get('products/' + id.to_s + '.json', {})
    end

    # Products similar to a product with <id> id
    def similar_products(id)
      get('products/' + id.to_s + '/similars.json', {})
    end
  end
end
