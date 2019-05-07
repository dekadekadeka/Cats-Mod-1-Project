class CreateCats < ActiveRecord::Migration[5.0]
    def change
        create_table :cats do |t|
            t.string :name
            t.string :breed
            t.string :color
            t.string :favorite_food
            t.boolean :temperment #gets along with other cats? true or false
        end
    end
end