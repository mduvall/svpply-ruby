module Svpply
  module Search
    # Query is the term to search for, optionally constrained/sorted by below args
    # Filters representation is filters[gender][], filters[prices][]
    # sort_by accepts element in ['trending_score', 'added_count', 'date_created']
    # Example call to search_products would look like:
    #   Svpply.search_products('jackets', ['trending_score'], {genders: ['female']})
    def search_products(query, sort_by, filters)
      get('products/search.json', {
        query: query,
        sort_by: sort_by,
        filters: filters
      })
    end
  end
end