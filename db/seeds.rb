Cat.destroy_all
Owner.destroy_all
Neighborhood.destroy_all

college_park = Neighborhood.create(name: "College Park", location: "Atlanta, GA")
midtown = Neighborhood.create(name: "Midtown", location: "Atlanta, GA")
west_end = Neighborhood.create(name: "West End", location: "Atlanta, GA")

deka = Owner.create(name: "Deka", address: "123 Grande River Road SW", food_provided: "wet AND dry", cat_already: true, dog: false, neighborhood_id: college_park.id)
scott = Owner.create(name: "Scott", address: "897 Beecher Street SW", food_provided: "wet", cat_already: true, dog: true, neighborhood_id: west_end.id)
tiffani = Owner.create(name: "Tiffani", address: "212 East 15th Street NW", food_provided: "dry", cat_already: false, dog: false, neighborhood_id: college_park.id)
nerajno = Owner.create(name: "Nerajno", address: "77 Rivers Station Road NE", food_provided: "wet AND dry", cat_already: true, dog: false, neighborhood_id: midtown.id)
viraj = Owner.create(name: "Viraj", address: "555 Captiol View Manor SW", food_provided: "dry", cat_already: true, dog: false, neighborhood_id: west_end.id)
keri = Owner.create(name: "Keri", address: "897 Beecher Street SW", food_provided: "wet AND dry", cat_already: true, dog: true, neighborhood_id: west_end.id)
brit = Owner.create(name: "Brit", address: "1919 Ormewood Park Avenue SE", food_provided: "wet AND dry", cat_already: false, dog: true, neighborhood_id: midtown.id)
hanaa = Owner.create(name: "Hanaa", address: "432 Flatiron Road SE", food_provided: "wet", cat_already: false, dog: false, neighborhood_id: midtown.id)
tez = Owner.create(name: "Tez", address: "499 Tez Circle NW", food_provided: "wet AND dry", cat_already: true, dog: true, neighborhood_id: midtown.id)
tammy = Owner.create(name: "Tammy", address: "54 Tammy Lane NE", food_provided: "wet", cat_already: false, dog: false, neighborhood_id: college_park.id)
will = Owner.create(name: "Will", address: "901 Willaford Place NE", food_provided: "dry", cat_already: true, dog: false, neighborhood_id: midtown.id)
tun = Owner.create(name: "Tun", address: "474 Bike Daddy Road SE", food_provided: "wet AND dry", cat_already: false, dog: true, neighborhood_id: midtown.id)

bintang = Cat.create(name: "Bintang", breed: "Domestic Shorthair", color: "grey", favorite_food: "wet", temperament: true, neighborhood_id: college_park.id, owner_id: deka.id)
citlali = Cat.create(name: "Citlali", breed: "Domestic Shorthair", color: "calico", favorite_food: "dry", temperament: false, neighborhood_id: college_park.id, owner_id: deka.id)
pinta = Cat.create(name: "Pinta", breed: "Domestic Shorthair", color: "calico", favorite_food: "wet", temperament: false, neighborhood_id: college_park.id, owner_id: deka.id)
lemon = Cat.create(name: "Lemon", breed: "Maine Coon", color: "grey and black", favorite_food: "wet", temperament: false, neighborhood_id: west_end.id, owner_id: scott.id)
pip = Cat.create(name: "Pip", breed: "Turkish Van", color: "orange and white", favorite_food: "dry", temperament: true, neighborhood_id: west_end.id, owner_id: scott.id)
apollo = Cat.create(name: "Apollo", breed: "Domestic Longhair", color: "golden", favorite_food: "wet", temperament: true, neighborhood_id: west_end.id, owner_id: scott.id)
paul = Cat.create(name: "Paul", breed: "Domestic Shorthair", color: "black and white", favorite_food: "wet", temperament: true, neighborhood_id: west_end.id, owner_id: viraj.id)
toni = Cat.create(name: "Toni", breed: "Turkish Van", color: "white", favorite_food: "dry", temperament: true, neighborhood_id: west_end.id, owner_id: viraj.id)
cannoli = Cat.create(name: "Cannoli", breed: "Perma-kitten", color: "grey and black", favorite_food: "wet", temperament: false, neighborhood_id: west_end.id, owner_id: viraj.id)
porch_kitty = Cat.create(name: "Porch Kitty", breed: "Domestic Shorthair", color: "black and white", favorite_food: "dry", temperament: true, neighborhood_id: midtown.id, owner_id: hanaa.id)
lyka = Cat.create(name: "Lyka", breed: "Domestic Shorthair", color: "black", favorite_food: "dry", temperament: false, neighborhood_id: midtown.id, owner_id: brit.id)
panda = Cat.create(name: "Panda", breed: "Snowshoe", color: "white, tan, brown", favorite_food: "dry", temperament: true, neighborhood_id: midtown.id, owner_id: will.id)
cindy = Cat.create(name: "Cindy Clawford", breed: "Domestic Shorthair", color: "black and white", favorite_food: "wet", temperament: true, neighborhood_id: college_park.id, owner_id: tiffani.id)