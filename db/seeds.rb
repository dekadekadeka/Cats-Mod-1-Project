Cat.create(name: "Bintang", breed: "Domestic Shorthair", color: "grey", favorite_food: "wet", temperament: true)
Cat.create(name: "Citlali", breed: "Domestic Shorthair", color: "calico", favorite_food: "dry", temperament: false)
Cat.create(name: "Pinta", breed: "Domestic Shorthair", color: "calico", favorite_food: "wet", temperament: false)
Cat.create(name: "Lemon", breed: "Maine Coon", color: "grey and black", favorite_food: "wet", temperament: false)
Cat.create(name: "Pip", breed: "Turkish Van", color: "orange and white", favorite_food: "dry", temperament: true)
Cat.create(name: "Apollo", breed: "Domestic Longhair", color: "golden", favorite_food: "wet", temperament: true)

Owner.create(name: "Deka", address: "Grande River Rd", food_provided: "wet AND dry", cat_already: true, dog: false)
Owner.create(name: "Scott", address: "Peachtree St", food_provided: "wet", cat_already: true, dog: true)
Owner.create(name: "Tiffani", address: "15th Street", food_provided: "dry", cat_already: false, dog: false)
Owner.create(name: "Nerando", address: "Rivers Station Rd", food_provided: "wet AND dry", cat_already: true, dog: false)

Neighborhood.create(name: "College Park", location: "Atlanta, GA")
Neighborhood.create(name: "Midtown", location: "Atlanta, GA")