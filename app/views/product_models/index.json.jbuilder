json.array!(@product_models) do |product_model|
  json.extract! product_model, :id, :name, :price, :value, :desc, :available_options, :available_colors, :available_sizes, :item_type
  json.url product_model_url(product_model, format: :json)
end
