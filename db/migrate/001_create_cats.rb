class CreateCats < ActiveRecord::Migration[5.0]
    def change
        create_table :cats do |t|
            t.string :name
            t.string :breed
            t.string :color
            t.string :favorite_food  # wet or dry only
            t.boolean :temperament  # gets along with other cats? true or false
        end
    end
end