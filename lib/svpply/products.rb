module Svpply
  module Products
    def product(id)
      get('products/' + id.to_s + '.json', {})
    end
  end
end
