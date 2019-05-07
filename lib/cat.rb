class Cat < ActiveRecord::Base
    has_many :neighborhoods
    has_many :owners, through: :neighborhoods
end