class Neighborhood < ActiveRecord::Base
    has_many :cats
    has_many :owners, through: :cats
end