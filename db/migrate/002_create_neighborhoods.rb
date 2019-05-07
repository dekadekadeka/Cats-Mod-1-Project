class CreateNeighborhoods < ActiveRecord::Migration[5.0]
    def change
        create_table :neighborhoods do |t|
            t.string :name
            t.string :location #city and state
        end
    end
end