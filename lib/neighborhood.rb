class Neighborhood < ActiveRecord::Base
    belongs_to :cat
    belongs_to :owner
end