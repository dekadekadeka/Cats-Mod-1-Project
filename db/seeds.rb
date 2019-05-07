bintang = Cat.create(name: "Bintang", breed: "Domestic Shorthair", color: "grey", favorite_food: "wet", temperament: true)
citlali = Cat.create(name: "Citlali", breed: "Domestic Shorthair", color: "calico", favorite_food: "dry", temperament: false)
pinta = Cat.create(name: "Pinta", breed: "Domestic Shorthair", color: "calico", favorite_food: "wet", temperament: false)
lemon = Cat.create(name: "Lemon", breed: "Maine Coon", color: "grey and black", favorite_food: "wet", temperament: false)
pip = Cat.create(name: "Pip", breed: "Turkish Van", color: "orange and white", favorite_food: "dry", temperament: true)
apollo = Cat.create(name: "Apollo", breed: "Domestic Longhair", color: "golden", favorite_food: "wet", temperament: true)

deka = Owner.create(name: "Deka", address: "Grande River Rd", food_provided: "wet AND dry", cat_already: true, dog: false)
scott = Owner.create(name: "Scott", address: "Peachtree St", food_provided: "wet", cat_already: true, dog: true)
tiffani = Owner.create(name: "Tiffani", address: "15th Street", food_provided: "dry", cat_already: false, dog: false)
nerajno = Owner.create(name: "Nerajno", address: "Rivers Station Rd", food_provided: "wet AND dry", cat_already: true, dog: false)

college_park = Neighborhood.create(name: "College Park", location: "Atlanta, GA")
midtown = Neighborhood.create(name: "Midtown", location: "Atlanta, GA")