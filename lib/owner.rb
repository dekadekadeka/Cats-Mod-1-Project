class Owner < ActiveRecord::Base
    has_many :neighborhoods
    has_many :cats, through: :neighborhoods
end