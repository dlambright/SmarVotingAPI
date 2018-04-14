class Topic < ApplicationRecord
    validates :creator, presence: true
    validates :text, presence: true
end
