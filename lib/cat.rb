class Cat < ActiveRecord::Base
    has_many :owners, through: :neighborhood
end