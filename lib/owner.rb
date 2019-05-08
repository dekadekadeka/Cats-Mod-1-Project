class Owner < ActiveRecord::Base
    belongs_to :neighborhood
    has_many :cats
end