class Order < ApplicationRecord
    belongs_to :user
    belongs_to :item
    has_one :customer 
    has_one_attached :image
end
