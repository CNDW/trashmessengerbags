json.array!(@products) do |product|
  json.extract! product, :name, :desc, :type, :price, :pid, :product_model, :category
  json.url product_url(product, format: :json)
end
