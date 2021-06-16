rachel = User.create(username:"rachel", email:"rachel@rachel.net", password:"password")
wimpy_boi = rachel.trees.create(nickname:"wimpy boi", tree_map_no:"1050758", species:"Flowering Dogwood")
june = wimpy_boi.journals.create(activities:"weeded", health_rating:"fine", litter_rating:"horrible", notes:"large boxes present")
july = wimpy_boi.journals.create(activities:"mulched", health_rating:"good", litter_rating:"fine", notes:"bike leaning against")

emmylou = User.create(username:"emmylou", email:"emmylou@mrplow.com", password:"password123")
wildflower = emmylou.trees.create(nickname:"wildflowers", tree_map_no:"42069", species:"Flowering Dogwood")
big_tree = emmylou.trees.create(nickname:"ol' big one", tree_map_no:"39170134", species:"London Planetree")
june = wildflower.journals.create(activities:"watered", health_rating:"good", litter_rating:"fine", notes:"no flowers")
july = wildflower.journals.create(activities:"mulched", health_rating:"poor", litter_rating:"good", notes:"some flowers!!")


# create_table "journals", force: :cascade do |t|
#     t.date "journal_time"
#     t.string "activities"
#     t.date "date_watered"
#     t.string "health_rating"
#     t.string "litter_rating"
#     t.string "notes"
#     t.integer "tree_id"
#   end

#   create_table "trees", force: :cascade do |t|
#     t.string "nickname"
#     t.string "image"
#     t.string "tree_map_no"
#     t.string "species"
#     t.integer "user_id"
#     t.integer "journal_id"
#   end