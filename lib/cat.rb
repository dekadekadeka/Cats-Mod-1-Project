class Cat < ActiveRecord::Base
    belongs_to :neighborhood
    belongs_to :owner
end