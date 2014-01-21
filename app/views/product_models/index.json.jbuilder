json.array!(@product_models) do |product_model|
  json.extract! product_model, :id, :name, :price, :desc
  json.url product_model_url(product_model, format: :json)
end
