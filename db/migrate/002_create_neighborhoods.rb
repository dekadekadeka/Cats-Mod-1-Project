class CreateNeighborhoods < ActiveRecord::Migrate
    def change
        create_table :neighborhoods do |t|
            t.string :name
            t.string :location #city and state
        end
    end
end