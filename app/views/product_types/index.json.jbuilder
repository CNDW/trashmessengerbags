json.array!(@product_types) do |product_type|
  json.extract! product_type, :id, :name, :price, :value, :desc, :available_models
  json.url product_type_url(product_type, format: :json)
end
