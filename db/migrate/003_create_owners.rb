class CreateOwners < ActiveRecord::Migration[5.0]
    def change
        create_table :owners do |t|
            t.string :name
            t.string :address
            t.string :food_provided #what type of food is the owner putting out?
            t.boolean :cat_already #does the owner already have a cat?
            t.boolean :dog #does the owner have a dog?
        end
    end
end