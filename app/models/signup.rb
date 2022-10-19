class Signup < ApplicationRecord
    belongs_to :camper
    belongs_to :activity
    validates :camper, presence: true
    validates :activity, presence: true

end
