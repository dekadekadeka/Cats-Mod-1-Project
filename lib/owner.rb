class Owner < ActiveRecord::Base
    has_many :cats, through: :neighborhood
end