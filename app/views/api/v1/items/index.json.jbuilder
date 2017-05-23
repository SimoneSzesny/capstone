  json.array! @items.each do |item|
    json.id item.id
    json.name item.name
    json.price item.price
    json.size item.size
    json.description item.description
    json.images item.images
    json.store_id item.store_id
    json.store_name item.store.name
    json.style item.style
    json.color item.color
  end