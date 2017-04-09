User.delete_all
Store.delete_all
StoreSubscription.delete_all
Item.delete_all


first_name = ["Simone", "Bob", "Jane", "Lisa"]
last_name = ["Szesny", "Smith", "Jones", "Linz"]
for i in 0..3 do
  user = User.new(first_name: first_name[i],last_name: last_name[i], email: "#{first_name[i]}@gmail.com", password:"password")
   user.save
end 

stores = ["Amazon", "Nordstrom", "Target"]
stores.each do |store|
  Store.create(name: store)
end
User.all.each do |user|
  store_ids = Store.pluck(:id)
  random_store_id = store_ids.sample
  StoreSubscription.create(user_id: user.id, store_id: random_store_id)
  item = Item.new(name: Faker::Hipster.words[0], price: rand(10..50), size: ["S", "M", "L"].sample, description: Faker::Hipster.paragraph(2,true,4), user_id: user.id, store_id: random_store_id)
  item.save
Image.create(item_id: item.id, image: "http://lp.hm.com/hmprod?set=key%5Bsource%5D,value%5B/model/2016/E00%200396371%20024%2056%201087.jpg%5D&set=key%5Brotate%5D,value%5B%5D&set=key%5Bwidth%5D,value%5B%5D&set=key%5Bheight%5D,value%5B%5D&set=key%5Bx%5D,value%5B%5D&set=key%5By%5D,value%5B%5D&set=key%5Btype%5D,value%5BSTILL_LIFE_FRONT%5D&set=key%5Bhmver%5D,value%5B4%5D&set=key%5Bquality%5D,value%5B80%5D&set=key%5Bsize%5D,value%5B346x405%5D&call=url%5Bfile:/mobile/v2/product%5D")
  Review.create(user_id: user.id, item_id: item.id, body: Faker::Hipster.paragraph)
end

puts "done!"