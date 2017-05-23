json.array! @styles.each do |style|
  json.id style.id
  json.name style.name
  json.selected false
  json.items style.items
end