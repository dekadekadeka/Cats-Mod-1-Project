class UpdateAll < ActiveRecord::Migration[5.0]
    def change
        add_column :owners, :neighborhood_id, :integer
        add_column :cats, :neighborhood_id, :integer 
        add_column :cats, :owner_id, :integer 
        remove_column :neighborhoods, :cat_id
        remove_column :neighborhoods, :owner_id
    end
end