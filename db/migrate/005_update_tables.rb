class UpdateTables < ActiveRecord::Migration[5.0]
    def change
        add_column :cats, :neighborhood, :string
        add_column :owners, :neighborhood, :string 
    end
end