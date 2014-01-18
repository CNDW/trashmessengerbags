json.array!(@custom_items) do |custom_item|
  json.extract! custom_item, :id
  json.url custom_item_url(custom_item, format: :json)
end
