json.extract! product, :id, :upc, :name, :price, :tax, :created_at, :updated_at
json.url product_url(product, format: :json)
