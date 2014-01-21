json.array!(@product_options) do |product_option|
  json.extract! product_option, :id, :name, :product_model_id
  json.url product_option_url(product_option, format: :json)
end
