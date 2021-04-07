class TravelDestination < ActiveRecord::Base
    belongs_to :user

    validates :location, presence: true
    validates :description, presence: true
    validates :rating, presence: true
end