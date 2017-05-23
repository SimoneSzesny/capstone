json.array! @colors.each do |color|
  json.id color.id
  json.name color.name
  json.selected false
  json.items color.items
end