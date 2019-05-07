class UpdateNeighborhood < ActiveRecord::Migration[5.0]
    def change
        add_column :neighborhoods, :owner_id, :integer
        add_column :neighborhoods, :cat_id, :integer 
        remove_column :cats, :neighborhood
        remove_column :owners, :neighborhood
    end
end